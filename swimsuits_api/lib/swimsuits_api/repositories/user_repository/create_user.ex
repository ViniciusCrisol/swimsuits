defmodule SwimsuitsApi.Repositories.UserRepository.CreateUser do
  alias SwimsuitsApi.Schemas.UserSchema

  @error_message "Internal server error, try again!"

  def call(params) do
    case UserSchema.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end
end
