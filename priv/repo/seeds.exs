# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rockelivery.{Item, Order, Repo, User}

IO.puts("=========Inserting user...==========")

user = %User{
  age: 27,
  adress: "Rua das bananaeiras, 15",
  cep: "12070350",
  cpf: "01123456789",
  email: "edutest2@test.com",
  password: "123456",
  name: "Eduardo Teste"
}

%User{id: user_id} = Repo.insert!(user)

IO.puts("=========Inserting items...==========")

item1 = %Item{
  category: :food,
  description: "banana cozida",
  price: Decimal.new("10.50"),
  photo: "priv/photos/banan_cozida.jpg"
}

item2 = %Item{
  category: :food,
  description: "banana frita",
  price: Decimal.new("11.50"),
  photo: "priv/photos/banan_frita.jpg"
}

Repo.insert!(item1)
Repo.insert!(item2)

IO.puts("=========Inserting order...==========")

order = %Order{
  user_id: user_id,
  items: [item1, item2],
  adress: "Rua das bananeiras, 15",
  comments: "sem canela",
  payment_method: :debit_card
}

Repo.insert!(order)
