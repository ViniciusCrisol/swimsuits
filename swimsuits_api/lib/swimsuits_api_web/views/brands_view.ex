defmodule SwimsuitsApiWeb.BrandsView do
  use SwimsuitsApiWeb, :view

  alias SwimsuitsApi.Schemas.BrandSchema

  def render("create_and_update.json", %{
        brand: %BrandSchema{
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
