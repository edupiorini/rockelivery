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

user = %User{
  age: 27,
  adress: "Rua das bananaeiras, 15",
  cep: "12070350",
  cpf: "12345678900",
  email: "edutest@test.com",
  password: "123456",
  name: "Eduardo"
}

%User{id: user_id} = Repo.insert!(user)

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

order = %Order{
  user_id: user_id,
  items: [item1, item2],
  address: "Rua das bananeiras, 15",
  comments: "sem canela",
  payment_method: :debit
}

Repo.insert!(order)
