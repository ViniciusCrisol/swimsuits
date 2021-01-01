use Mix.Config

config :app, App.Repo,
  username: "postgres",
  password: "postgres",
  database: "app_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :app, WebApp.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
