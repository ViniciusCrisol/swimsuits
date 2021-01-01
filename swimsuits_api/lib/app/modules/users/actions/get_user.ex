defmodule App.Modules.User.Get do
  alias Ecto.UUID
  alias App.Repo
  alias App.Modules.User

  def call(id) do
    id
    |> UUID.cast()
    |> get_user()
  end

  defp get_user(:error), do: {:error, :unauthorized, "invalid ID format"}

  defp get_user({:ok, uuid}) do
    uuid
    |> fetch_user()
    |> validate_user()
  end

  defp fetch_user(uuid), do: Repo.get(User, uuid)

  defp validate_user(nil), do: {:error, :not_found, "user not found"}
  defp validate_user(user), do: {:ok, user}
end
