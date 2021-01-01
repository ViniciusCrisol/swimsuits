defmodule WebApp.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(WebApp.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(WebApp.Gettext, "errors", msg, opts)
    end
  end
end
