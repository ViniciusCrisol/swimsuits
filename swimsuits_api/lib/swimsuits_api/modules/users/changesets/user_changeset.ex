defmodule SwimsuitsApi.Modules.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias SwimsuitsApi.Repo
  alias SwimsuitsApi.Modules.Adress

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @required_params [:name, :email, :password]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
    has_many(:adress, Adress)
  end

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(user, params), do: create_changeset(user, params)

  defp create_changeset(module_or_user, params) do
    module_or_user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2, max: 100)
    |> validate_length(:email, min: 2, max: 100)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
