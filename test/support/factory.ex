defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 28,
      "adress" => "rua de teste, 25",
      "cep" => "12070350",
      "cpf" => "37779593835",
      "email" => "teste@teste.com",
      "password" => "123456",
      "name" => "Eduardo"
    }
  end

  def stringuser_params_factory do
    %{
      "age" => 28,
      "adress" => "rua de teste, 25",
      "cep" => "12070350",
      "cpf" => "37779593835",
      "email" => "teste@teste.com",
      "password" => "123456",
      "name" => "Eduardo"
    }
  end

  def user_factory do
    %User{
      age: 28,
      adress: "rua de teste, 25",
      cep: "12070350",
      cpf: "37779593835",
      email: "teste@teste.com",
      password: "123456",
      name: "Eduardo",
      id: "58edadfd-460a-4698-9ef2-195b67eca239"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
