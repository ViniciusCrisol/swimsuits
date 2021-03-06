defmodule App.Modules.City do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Repo
  alias App.Modules.Adress

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_params [:name]

  schema "cities" do
    field :name, :string

    timestamps()
    has_many(:adress, Adress)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(city, params), do: create_changeset(city, params)

  defp create_changeset(module_or_city, params) do
    module_or_city
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2, max: 50)
    |> unique_constraint(:name)
  end
end
