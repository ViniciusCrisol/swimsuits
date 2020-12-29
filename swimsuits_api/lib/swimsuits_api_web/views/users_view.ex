defmodule SwimsuitsApiWeb.UsersView do
  use SwimsuitsApiWeb, :view

  alias SwimsuitsApi.Schemas.UserSchema

  def render("create_and_update.json", %{
        token: token,
        user: %UserSchema{id: id, name: name, email: email, inserted_at: inserted_at}
      }) do
    %{
      token: token,
      user: %{id: id, name: name, email: email, inserted_at: inserted_at}
    }
  end
end
