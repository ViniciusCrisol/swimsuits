defmodule WebApp.FallbackController do
  use WebApp, :controller

  def call(conn, {:error, status, result}) do
    conn
    |> put_status(status)
    |> put_view(WebApp.ErrorView)
    |> render("error.json", result: result)
  end
end
