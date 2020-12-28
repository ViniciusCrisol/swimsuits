defmodule SwimsuitsApiWeb.Router do
  use SwimsuitsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SwimsuitsApiWeb do
    pipe_through :api

    post "/users", UsersController, :create
    post "/users/session", SessionsController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: SwimsuitsApiWeb.Telemetry
    end
  end
end
