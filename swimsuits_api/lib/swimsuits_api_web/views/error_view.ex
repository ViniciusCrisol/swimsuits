defmodule SwimsuitsApiWeb.ErrorView do
  use SwimsuitsApiWeb, :view

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
