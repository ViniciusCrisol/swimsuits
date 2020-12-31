defmodule SwimsuitsApi.Repositories.Adress.CreateAdress do
  alias SwimsuitsApi.Schemas.{Adress, City, State}
  alias SwimsuitsApi.Repo

  @error_message "Internal server error, try again!"

  def call(%{"id" => user_id} = params) do
    with {:ok, %{id: city_id}} <- get_city(params),
         {:ok, %{id: state_id}} <- get_state(params) do
      Map.merge(params, %{"city_id" => city_id, "state_id" => state_id, "user_id" => user_id})
      |> create_adress()
      |> get_adress_city()
      |> get_adress_state()
    else
      {:error, changeset} -> {:error, :bad_request, changeset}
    end
  end

  defp create_adress(params) do
    case Adress.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end

  defp get_city(%{"city" => city}) do
    case Repo.get_by(City, name: city) do
      nil -> City.build(%{"name" => String.downcase(city)})
      city -> {:ok, city}
    end
  end

  defp get_city(_params), do: {:error, %{city: ["can't be blank"]}}

  defp get_state(%{"state" => state}) do
    case Repo.get_by(State, abbreviation: state) do
      nil -> State.build(%{"abbreviation" => String.upcase(state)})
      state -> {:ok, state}
    end
  end

  defp get_state(_params), do: {:error, %{state: ["can't be blank"]}}

  defp get_adress_city({:error, _status, _reason} = error), do: error
  defp get_adress_city({:ok, adress}), do: {:ok, Repo.preload(adress, :city)}

  defp get_adress_state({:error, _status, _reason} = error), do: error
  defp get_adress_state({:ok, adress}), do: {:ok, Repo.preload(adress, :state)}
end
