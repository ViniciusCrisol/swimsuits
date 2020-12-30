defmodule SwimsuitsApi.Repo.Migrations.AddAdressesTable do
  use Ecto.Migration

  def change do
    create table(:adresses, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :postal_code, :string, size: 10
      add :street, :string, size: 50
      add :number, :string, size: 20
      add :neighborhood, :string, size: 50
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
      add :city_id, references(:cities, type: :uuid, on_delete: :delete_all), null: false
      add :state_id, references(:states, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
