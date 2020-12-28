use Mix.Config

config :swimsuits_api, SwimsuitsApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "swimsuits_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :swimsuits_api, SwimsuitsApiWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
