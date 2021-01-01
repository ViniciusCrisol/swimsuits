defmodule SwimsuitsApi do
  alias SwimsuitsApi.Modules.{User, Brand, Adress, Product}

  defdelegate fetch_user(params), to: User.Get, as: :call
  defdelegate create_user(params), to: User.Create, as: :call

  defdelegate create_brand(params), to: Brand.Create, as: :call

  defdelegate create_adress(params), to: Adress.Create, as: :call

  defdelegate create_product(params), to: Product.Create, as: :call
end
