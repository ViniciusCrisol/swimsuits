defmodule App.Repo.Migrations.AddProductsTable do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :model, :string
      add :price, :float
      add :description, :text
      add :thumbnail_url, :string, size: 100
      add :brand_id, references(:brands, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
