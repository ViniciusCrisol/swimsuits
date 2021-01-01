defmodule App.Repo.Migrations.AddSizesTable do
  use Ecto.Migration

  def change do
    create table(:sizes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :size, :string, size: 3
      add :available_quantity, :integer
      add :product_id, references(:products, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
