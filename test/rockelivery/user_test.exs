defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 28,
        adress: "rua de teste, 25",
        cep: "12070350",
        cpf: "37779593835",
        email: "teste@teste.com",
        password: "123456",
        name: "Eduardo"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Eduardo"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 28,
        adress: "rua de teste, 25",
        cep: "12070350",
        cpf: "37779593835",
        email: "teste@teste.com",
        password: "123456",
        name: "Eduardo"
      }

      updated_params = %{
        password: "123456",
        name: "Duardo"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(updated_params)

      assert %Changeset{changes: %{name: "Duardo"}, valid?: true} = response
    end

    test "when there are errors, returns an invalid changeset" do
      params = %{
        age: 15,
        adress: "rua de teste, 25",
        cep: "12070350",
        cpf: "37779593835",
        email: "teste@teste.com",
        password: "123",
        name: "Eduardo"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
