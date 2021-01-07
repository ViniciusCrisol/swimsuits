defmodule App.Modules.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Repo
  alias App.Modules.{Brand, Size}

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:model, :price, :thumbnail_url, :description, :brand_id]

  schema "products" do
    field :model, :string
    field :price, :float
    field :thumbnail_url, :string
    field :description, :string

    timestamps()
    belongs_to(:brand, Brand)
    has_many(:size, Size)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(product, params), do: create_changeset(product, params)

  defp create_changeset(module_or_product, params) do
    module_or_product
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:model, min: 2, max: 50)
    |> validate_length(:thumbnail_url, min: 2, max: 100)
    |> validate_format(
      :thumbnail_url,
      ~r/https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,}/i
    )
    |> validate_length(:description, min: 5)
    |> foreign_key_constraint(:brand_id)
  end
end
