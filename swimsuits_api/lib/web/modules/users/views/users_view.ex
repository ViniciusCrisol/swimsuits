defmodule WebApp.UsersView do
  use WebApp, :view

  alias App.Modules.User

  def render("create_and_update.json", %{
        token: token,
        user: %User{id: id, name: name, email: email, inserted_at: inserted_at}
      }) do
    %{
      token: token,
      user: %{id: id, name: name, email: email, inserted_at: inserted_at}
    }
  end
end
