defmodule SwimsuitsApi.Repositories.Adress.CreateAdress do
  alias SwimsuitsApi.Schemas.{Adress, City, State}
  alias SwimsuitsApi.Repo

  def call(params) do
    with {:ok, city} <- get_city(params), {:ok, state} <- get_state(params) do
      %{city: city, state: state}
    else
      {:error, changeset} -> {:error, :bad_request, changeset}
    end
  end

  # Criar endereço!

  # defp create_adress(params) do
  #   case Adress.build(params) do
  #     {:ok, _user} = params -> params
  #     {:error, changeset} -> {:error, :bad_request, changeset}
  #     _error -> {:error, :internal_server_error, @error_message}
  #   end
  # end

  defp get_city(%{"city" => city}) do
    case Repo.get_by(City, name: city) do
      nil -> City.build(%{"name" => city})
      city -> {:ok, city}
    end
  end

  defp get_state(%{"state" => state}) do
    case Repo.get_by(State, abbreviation: state) do
      nil -> State.build(%{"abbreviation" => state})
      state -> {:ok, state}
    end
  end
end
