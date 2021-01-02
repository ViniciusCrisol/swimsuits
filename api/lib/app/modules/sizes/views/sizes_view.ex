defmodule WebApp.SizesView do
  use WebApp, :view

  def render("create_and_update.json", %{
        brand: %{
          id: id,
          size: size,
          available_quantity: available_quantity,
          inserted_at: inserted_at
        }
      }) do
    %{id: id, size: size, available_quantity: available_quantity, inserted_at: inserted_at}
  end
end
