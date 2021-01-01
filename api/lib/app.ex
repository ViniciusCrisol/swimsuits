defmodule App do
  alias App.Modules.{User, Brand, Adress, Product, Size}

  defdelegate fetch_user(params), to: User.Get, as: :call
  defdelegate create_user(params), to: User.Create, as: :call

  defdelegate create_brand(params), to: Brand.Create, as: :call

  defdelegate create_adress(params), to: Adress.Create, as: :call

  defdelegate create_product(params), to: Product.Create, as: :call

  defdelegate create_size(params), to: Size.Create, as: :call
end
