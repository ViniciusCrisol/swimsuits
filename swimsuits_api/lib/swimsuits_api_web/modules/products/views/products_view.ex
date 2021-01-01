defmodule SwimsuitsApiWeb.ProductsView do
  use SwimsuitsApiWeb, :view

  alias SwimsuitsApi.Modules.{Product, Brand}

  def render("create_and_update.json", %{
        product: %Product{
          id: id,
          model: model,
          price: price,
          description: description,
          brand: %Brand{name: brand_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      model: model,
      price: price,
      description: description,
      brand: brand_name,
      inserted_at: inserted_at
    }
  end
end
