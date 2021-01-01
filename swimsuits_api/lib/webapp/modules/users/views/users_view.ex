defmodule WebApp.UsersView do
  use WebApp, :view

  def render("create_and_update.json", %{
        token: token,
        user: %{id: id, name: name, email: email, inserted_at: inserted_at}
      }) do
    %{
      token: token,
      user: %{id: id, name: name, email: email, inserted_at: inserted_at}
    }
  end
end
