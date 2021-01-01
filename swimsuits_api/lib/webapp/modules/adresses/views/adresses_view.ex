defmodule WebApp.AdressesView do
  use WebApp, :view

  def render("create_and_update.json", %{
        adress: %{
          id: id,
          user_id: user_id,
          postal_code: postal_code,
          number: number,
          street: street,
          city: %{name: city_name},
          state: %{abbreviation: state_abbreviation},
          neighborhood: neighborhood,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      user_id: user_id,
      number: number,
      street: street,
      postal_code: postal_code,
      city: city_name,
      state: state_abbreviation,
      neighborhood: neighborhood,
      inserted_at: inserted_at
    }
  end
end
