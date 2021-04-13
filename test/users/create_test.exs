defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, return an user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 28, email: "teste@teste.com"}} = response
    end

    test "when there are invalid params, returns an error" do
      invalid_params = %{password: "123", age: 15}
      params = build(:user_params, invalid_params)


      response = Create.call(params)expeted_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      assert errors_on(changeset) == expeted_response
    end
  end
end
