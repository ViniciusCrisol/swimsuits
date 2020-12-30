defmodule SwimsuitsApi.Repositories.Brand.CreateBrand do
  alias SwimsuitsApi.Schemas.Brand

  @error_message "Internal server error, try again!"

  def call(params) do
    case Brand.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end
end
