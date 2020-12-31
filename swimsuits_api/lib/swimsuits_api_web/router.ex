defmodule SwimsuitsApiWeb.Router do
  use SwimsuitsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug SwimsuitsApiWeb.Auth.Pipeline
  end

  scope "/api", SwimsuitsApiWeb do
    pipe_through :api

    post "/users", UsersController, :create
    post "/users/session", SessionsController, :create
  end

  scope "/api", SwimsuitsApiWeb do
    pipe_through [:api, :auth]

    resources "/brands", BrandsController, only: [:create]
    post "/users/adresses/:id", AdressesController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: SwimsuitsApiWeb.Telemetry
    end
  end
end
