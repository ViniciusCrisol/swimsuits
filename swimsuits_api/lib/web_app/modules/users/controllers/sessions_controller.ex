defmodule WebApp.SessionsController do
  use WebApp, :controller

  alias WebApp.Auth.Guardian

  action_fallback WebApp.FallbackController

  def create(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", token: token)
    end
  end
end
