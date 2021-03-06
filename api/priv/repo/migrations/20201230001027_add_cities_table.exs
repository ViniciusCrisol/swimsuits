defmodule App.Repo.Migrations.AddCitiesTable do
  use Ecto.Migration

  def change do
    create table(:cities, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 50
      timestamps()
    end
    create unique_index(:cities, [:name])
  end
end
