defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      # os campos vão ser repassados automaticamentes através do Jason.Encoder
      user: user
      # que adicionamos no nosso schema user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
