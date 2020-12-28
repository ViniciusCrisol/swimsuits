defmodule SwimsuitsApiWeb.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(SwimsuitsApiWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(SwimsuitsApiWeb.Gettext, "errors", msg, opts)
    end
  end
end
