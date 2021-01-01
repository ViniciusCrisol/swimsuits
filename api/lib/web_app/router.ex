defmodule WebApp.Router do
  use WebApp, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug WebApp.Auth.Pipeline
  end

  scope "/api", WebApp do
    pipe_through :api

    post "/users", UsersController, :create
    post "/users/session", SessionsController, :create
  end

  scope "/api", WebApp do
    pipe_through [:api, :auth]

    post "/users/adresses/:user_id", AdressesController, :create
    post "/brands", BrandsController, :create
    post "/products", ProductsController, :create
    post "/products/sizes/:product_id", SizesController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WebApp.Telemetry
    end
  end
end
