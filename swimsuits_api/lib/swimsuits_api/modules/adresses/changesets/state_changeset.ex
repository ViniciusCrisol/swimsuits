defmodule SwimsuitsApi.Modules.State do
  use Ecto.Schema
  import Ecto.Changeset

  alias SwimsuitsApi.Repo
  alias SwimsuitsApi.Modules.Adress

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_params [:abbreviation]

  schema "states" do
    field :abbreviation, :string

    timestamps()
    has_many(:adress, Adress)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(brand, params), do: create_changeset(brand, params)

  defp create_changeset(module_or_state, params) do
    module_or_state
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:abbreviation, min: 2, max: 2)
    |> unique_constraint(:abbreviation)
  end
end
