defmodule SwimsuitsApi.Modules.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias SwimsuitsApi.Repo
  alias SwimsuitsApi.Modules.Brand

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:model, :price, :description, :brand_id]

  schema "products" do
    field :model, :string
    field :price, :float
    field :description, :string

    timestamps()
    belongs_to(:brand, Brand)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(user, params), do: create_changeset(user, params)

  defp create_changeset(module_or_product, params) do
    module_or_product
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:model, min: 2, max: 50)
    |> validate_length(:description, min: 5)
    |> foreign_key_constraint(:brand_id)
  end
end
