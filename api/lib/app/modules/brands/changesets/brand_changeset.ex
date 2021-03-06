defmodule App.Modules.Brand do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Repo
  alias App.Modules.Product

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_params [:name]

  schema "brands" do
    field :name, :string

    timestamps()
    has_many(:product, Product)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(brand, params), do: create_changeset(brand, params)

  defp create_changeset(module_or_brand, params) do
    module_or_brand
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2, max: 25)
    |> unique_constraint(:name)
  end
end
