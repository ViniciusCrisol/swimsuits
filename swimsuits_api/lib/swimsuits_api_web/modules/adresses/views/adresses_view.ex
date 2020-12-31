defmodule SwimsuitsApiWeb.AdressesView do
  use SwimsuitsApiWeb, :view

  alias SwimsuitsApi.Modules.{Adress, City, State}

  def render("create_and_update.json", %{
        adress: %Adress{
          id: id,
          user_id: user_id,
          postal_code: postal_code,
          city: %City{name: city_name},
          state: %State{abbreviation: state_abbreviation},
          neighborhood: neighborhood,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      user_id: user_id,
      postal_code: postal_code,
      city: city_name,
      state: state_abbreviation,
      neighborhood: neighborhood,
      inserted_at: inserted_at
    }
  end
end
