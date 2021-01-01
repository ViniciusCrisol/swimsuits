defmodule App.Modules.Product.Create do
  alias App.Modules.Product
  alias App.Repo

  @error_message "internal server error, try again"

  def call(params) do
    params
    |> create_product()
    |> get_product_brand()
  end

  defp create_product(params) do
    case Product.build(params) do
      {:ok, _user} = params -> params
      {:error, changeset} -> {:error, :bad_request, changeset}
      _error -> {:error, :internal_server_error, @error_message}
    end
  end

  defp get_product_brand({:error, _status, _reason} = error), do: error
  defp get_product_brand({:ok, product}), do: {:ok, Repo.preload(product, :brand)}
end
