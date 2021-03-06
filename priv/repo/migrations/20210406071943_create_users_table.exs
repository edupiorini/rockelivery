defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:adress, :string)
      add(:age, :integer)
      add(:cep, :string)
      add(:cpf, :string)
      add(:email, :string)
      add(:password_hash, :string)
      add(:name, :string)
      timestamps()
    end

    create(unique_index(:users, [:cpf]))
    # criamos separados para trataros os erros separadamente
    create(unique_index(:users, [:email]))
  end
end
