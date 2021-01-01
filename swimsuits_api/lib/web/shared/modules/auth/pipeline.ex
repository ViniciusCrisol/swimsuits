defmodule WebApp.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :app

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
