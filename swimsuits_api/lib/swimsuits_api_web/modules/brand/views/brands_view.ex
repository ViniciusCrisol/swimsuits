defmodule SwimsuitsApiWeb.BrandsView do
  use SwimsuitsApiWeb, :view

  alias SwimsuitsApi.Modules.Brand

  def render("create_and_update.json", %{
        brand: %Brand{
          id: id,
          name: name,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
  end
end
