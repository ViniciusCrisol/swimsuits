defmodule SwimsuitsApi.Repositories.BrandRepository.CreateBrand do
  alias SwimsuitsApi.Schemas.BrandSchema

  @error_message "Internal server error, try again!"

  def call(params) do
    case BrandSchema.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end
end
