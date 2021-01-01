defmodule WebApp.ProductsController do
  use WebApp, :controller

  action_fallback WebApp.FallbackController

  def create(conn, params) do
    params
    |> App.create_product()
    |> handle_response(conn, "create_and_update.json", :created)
  end

  defp handle_response({:error, _error_status, _reason} = error, _conn, _view, _status), do: error

  defp handle_response({:ok, product}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, product: product)
  end
end
