defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"
    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created",
             token: "xpto1234",
             user: %Rockelivery.User{
               adress: "rua de teste, 25",
               age: 28,
               cep: "12070350",
               cpf: "37779593835",
               email: "teste@teste.com",
               id: "58edadfd-460a-4698-9ef2-195b67eca239",
               inserted_at: nil,
               name: "Eduardo",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
