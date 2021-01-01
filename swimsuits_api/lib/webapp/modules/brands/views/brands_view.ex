defmodule WebApp.BrandsView do
  use WebApp, :view

  def render("create_and_update.json", %{
        brand: %{id: id, name: name, inserted_at: inserted_at}
      }) do
    %{id: id, name: name, inserted_at: inserted_at}
  end
end
