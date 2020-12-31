defmodule SwimsuitsApiWeb.SessionsView do
  use SwimsuitsApiWeb, :view

  def render("create.json", %{token: token}) do
    %{token: token}
  end
end
