defmodule SwimsuitsApi do
  alias SwimsuitsApi.Repositories.{UserRepository, BrandRepository}

  defdelegate fetch_user(params), to: UserRepository.GetUser, as: :call
  defdelegate create_user(params), to: UserRepository.CreateUser, as: :call

  defdelegate create_brand(params), to: BrandRepository.CreateBrand, as: :call
end
