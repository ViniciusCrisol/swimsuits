defmodule SwimsuitsApiWeb.SessionsController do
  use SwimsuitsApiWeb, :controller

  alias SwimsuitsApiWeb.Auth.Guardian

  action_fallback SwimsuitsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", token: token)
    end
  end
end
