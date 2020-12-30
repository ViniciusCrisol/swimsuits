defmodule SwimsuitsApi.Repo.Migrations.AddStatesTable do
  use Ecto.Migration

  def change do
    create table(:states, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :abbreviation, :string, size: 2
      timestamps()
    end
    create unique_index(:states, [:abbreviation])
  end
end
