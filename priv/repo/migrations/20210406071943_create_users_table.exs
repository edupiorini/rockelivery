defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :adress, :string
      add :age, :integer
      add :cep, :string
      add :cpf, :string
      add :email, :string
      add :name, :string
      add :password_hash, :string

      timestamps()
    end
    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email]) #criamos separados para trataros os erros separadamente

  end
end
