defmodule SwimsuitsApiWeb.AdressesController do
  use SwimsuitsApiWeb, :controller

  action_fallback SwimsuitsApiWeb.FallbackController

  def create(conn, params) do
    SwimsuitsApi.create_adress(params)
    |> handle_response(conn, "create_and_update.json", :created)
  end

  defp handle_response({:error, _error_status, _reason} = error, _conn, _view, _status), do: error

  defp handle_response({:ok, adress}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, adress: adress)
  end
end
