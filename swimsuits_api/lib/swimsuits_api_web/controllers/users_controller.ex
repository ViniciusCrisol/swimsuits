defmodule SwimsuitsApiWeb.UsersController do
  use SwimsuitsApiWeb, :controller

  alias SwimsuitsApiWeb.Auth.Guardian

  action_fallback SwimsuitsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- SwimsuitsApi.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user, token: token})
    end
  end
end
