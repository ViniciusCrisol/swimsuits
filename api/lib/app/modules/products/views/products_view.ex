defmodule WebApp.ProductsView do
  use WebApp, :view

  def render("create_and_update.json", %{
        product: %{
          id: id,
          model: model,
          price: price,
          thumbnail_url: thumbnail_url,
          description: description,
          brand: %{name: brand_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      model: model,
      price: price,
      thumbnail_url: thumbnail_url,
      description: description,
      brand: brand_name,
      inserted_at: inserted_at
    }
  end
end
