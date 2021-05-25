defmodule RockeliveryWeb.Auth.Guardian do
  use Guardian, otp_app: :rockelivery

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Get, as: UserGet

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> UserGet.call()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- UserGet.call(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please, verify your credentials")}
      error -> error
    end
  end

  def authenticafe(_), do: {:error, Error.build(:bad_request, "Invalid, or missing params")}
end
