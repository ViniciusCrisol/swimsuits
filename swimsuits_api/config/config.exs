use Mix.Config

config :app,
  ecto_repos: [App.Repo]

config :app, WebApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ev0yGFgly6Ah2TYZSfcVtWGMrq01BlXnayA0QNoGfg6GtuoeqgiiHuaDrYAG9LNW",
  render_errors: [view: WebApp.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: App.PubSub,
  live_view: [signing_salt: "m3/3wRsq"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"

config :app, WebApp.Auth.Guardian,
  issuer: "app",
  secret_key: "ntcliUkYeo1bNJPnZ6gd82BsxCQPLQ6pjwTZRdrhwVnd+d1uSR2s/8LzUnzhfQYt"

config :app, WebApp.Auth.Pipeline,
  module: WebApp.Auth.Guardian,
  error_handler: WebApp.Auth.ErrorHandler
