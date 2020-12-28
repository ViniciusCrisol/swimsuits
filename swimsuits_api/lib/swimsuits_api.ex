defmodule SwimsuitsApi do
  alias SwimsuitsApi.Repositories.UserRepository

  defdelegate fetch_user(params), to: UserRepository.GetUser, as: :call
  defdelegate create_user(params), to: UserRepository.CreateUser, as: :call
end
