defmodule App.Modules.Size do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Repo
  alias App.Modules.Product

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:size, :available_quantity, :product_id]

  schema "sizes" do
    field :size, :string
    field :available_quantity, :integer

    timestamps()
    belongs_to(:product, Product)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(size, params), do: create_changeset(size, params)

  defp create_changeset(module_or_size, params) do
    module_or_size
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:size, min: 1, max: 3)
    |> foreign_key_constraint(:product_id)
  end
end
