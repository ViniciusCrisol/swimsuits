defmodule SwimsuitsApi.Application do
  use Application

  def start(_type, _args) do
    children = [
      SwimsuitsApi.Repo,
      SwimsuitsApiWeb.Telemetry,
      {Phoenix.PubSub, name: SwimsuitsApi.PubSub},
      SwimsuitsApiWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: SwimsuitsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    SwimsuitsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
