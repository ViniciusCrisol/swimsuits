defmodule SwimsuitsApi do
  alias SwimsuitsApi.Repositories.{User, Brand, Adress}

  defdelegate fetch_user(params), to: User.GetUser, as: :call
  defdelegate create_user(params), to: User.CreateUser, as: :call

  defdelegate create_brand(params), to: Brand.CreateBrand, as: :call

  defdelegate create_adress(params), to: Adress.CreateAdress, as: :call
end
