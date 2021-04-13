defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 28,
      adress: "rua de teste, 25",
      cep: "12070350",
      cpf: "37779593835",
      email: "teste@teste.com",
      password: "123456",
      name: "Eduardo"
    }
  end
end
