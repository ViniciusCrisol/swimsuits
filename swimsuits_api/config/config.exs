use Mix.Config

config :swimsuits_api,
  ecto_repos: [SwimsuitsApi.Repo]

config :swimsuits_api, SwimsuitsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ev0yGFgly6Ah2TYZSfcVtWGMrq01BlXnayA0QNoGfg6GtuoeqgiiHuaDrYAG9LNW",
  render_errors: [view: SwimsuitsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SwimsuitsApi.PubSub,
  live_view: [signing_salt: "m3/3wRsq"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
