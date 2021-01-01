defmodule SwimsuitsApi.Modules.Adress do
  use Ecto.Schema
  import Ecto.Changeset

  alias SwimsuitsApi.Repo
  alias SwimsuitsApi.Modules.{User, City, State}

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:postal_code, :street, :number, :neighborhood, :user_id, :city_id, :state_id]

  schema "adresses" do
    field :postal_code, :string
    field :street, :string
    field :number, :string
    field :neighborhood, :string

    timestamps()
    belongs_to(:user, User)
    belongs_to(:city, City)
    belongs_to(:state, State)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(brand, params), do: create_changeset(brand, params)

  defp create_changeset(module_or_adress, params) do
    module_or_adress
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:postal_code, min: 5, max: 10)
    |> validate_length(:street, min: 2, max: 50)
    |> validate_length(:number, min: 2, max: 20)
    |> validate_length(:neighborhood, min: 2, max: 50)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:city_id)
    |> foreign_key_constraint(:state_id)
  end
end
