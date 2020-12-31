defmodule SwimsuitsApi.Modules.User.Create do
  alias SwimsuitsApi.Modules.User

  @error_message "internal server error, try again"

  def call(params) do
    case User.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end
end
