defmodule WebApp.SessionsView do
  use WebApp, :view

  def render("create.json", %{token: token}) do
    %{token: token}
  end
end
