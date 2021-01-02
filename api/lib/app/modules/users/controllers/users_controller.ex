defmodule WebApp.UsersController do
  use WebApp, :controller

  alias WebApp.Auth.Guardian

  action_fallback WebApp.FallbackController

  def create(conn, params) do
    with {:ok, user} <- App.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create_and_update.json", %{user: user, token: token})
    end
  end
end
