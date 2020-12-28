defmodule SwimsuitsApi.Repo do
  use Ecto.Repo,
    otp_app: :swimsuits_api,
    adapter: Ecto.Adapters.Postgres
end
