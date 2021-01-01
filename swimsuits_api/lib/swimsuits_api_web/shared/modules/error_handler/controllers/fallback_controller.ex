defmodule SwimsuitsApiWeb.FallbackController do
  use SwimsuitsApiWeb, :controller

  def call(conn, {:error, status, result}) do
    conn
    |> put_status(status)
    |> put_view(SwimsuitsApiWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
