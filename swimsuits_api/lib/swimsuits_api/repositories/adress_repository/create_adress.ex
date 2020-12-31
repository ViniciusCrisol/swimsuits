defmodule SwimsuitsApi.Repositories.Adress.CreateAdress do
  alias SwimsuitsApi.Schemas.{Adress, City, State}
  alias SwimsuitsApi.Repo

  @error_message "Internal server error, try again!"

  def call(
        %{
          "postal_code" => postal_code,
          "street" => street,
          "number" => number,
          "neighborhood" => neighborhood,
          "user_id" => user_id
        } = params
      ) do
    with {:ok, %{id: city_id}} <- get_city(params),
         {:ok, %{id: state_id}} <- get_state(params) do
      create_adress(%{
        "postal_code" => postal_code,
        "street" => street,
        "number" => number,
        "neighborhood" => neighborhood,
        "user_id" => user_id,
        "city_id" => city_id,
        "state_id" => state_id
      })
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
      nil -> City.build(%{"name" => String.capitalize(city)})
      city -> {:ok, city}
    end
  end

  defp get_city(_params), do: {:error, "The city field cannot be blank!"}

  defp get_state(%{"state" => state}) do
    case Repo.get_by(State, abbreviation: state) do
      nil -> State.build(%{"abbreviation" => String.upcase(state)})
      state -> {:ok, state}
    end
  end

  defp get_state(_params), do: {:error, "The state field cannot be blank!"}
end
