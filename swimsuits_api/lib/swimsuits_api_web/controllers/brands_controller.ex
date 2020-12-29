defmodule SwimsuitsApiWeb.BrandsController do
  use SwimsuitsApiWeb, :controller

  action_fallback SwimsuitsApiWeb.FallbackController

  def create(conn, params) do
    SwimsuitsApi.create_brand(params)
    |> handle_response(conn, "create_and_update.json", :created)
  end

  defp handle_response({:error, _error_status, _reason} = error, _conn, _view, _status), do: error

  defp handle_response({:ok, brand}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, brand: brand)
  end
end
