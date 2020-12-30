defmodule SwimsuitsApi.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:Users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :abbreviation, :string, size: 2
      timestamps()
    end
    create unique_index(:Users, [:abbreviation])
  end
end
