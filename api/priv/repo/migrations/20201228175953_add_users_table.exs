defmodule App.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 100
      add :email, :string, size: 100
      add :password_hash, :string
      timestamps()
    end
    create unique_index(:users, [:email])
  end
end
