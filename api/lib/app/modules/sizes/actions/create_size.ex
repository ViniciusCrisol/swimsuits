defmodule App.Modules.Size.Create do
  alias App.Modules.Size

  @error_message "internal server error, try again"

  def call(%{"size" => size} = params),
    do: create_size(%{params | "size" => upcase_and_trim(size)})

  def call(_params), do: {:error, :bad_request, %{size: ["can't be blank"]}}

  defp create_size(params) do
    case Size.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end

  defp upcase_and_trim(string) do
    string
    |> String.upcase()
    |> String.trim()
  end
end
