defmodule SwimsuitsApiWeb.Auth.Guardian do
  use Guardian, otp_app: :swimsuits_api

  alias SwimsuitsApi.Repo
  alias SwimsuitsApi.Modules.User

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> SwimsuitsApi.fetch_user()
  end

  def authenticate(%{"email" => email, "password" => password}) do
    case Regex.run(~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i, email) do
      nil -> {:error, :unauthorized, "invalid e-mail format"}
      _ -> authenticate_user(password, email)
    end
  end

  defp authenticate_user(password, email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found, "user not found"}
      user -> validate_password(user, password)
    end
  end

  defp validate_password(%User{password_hash: hash} = user, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(user)
      false -> {:error, :unauthorized, "unauthorized"}
    end
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, token}
  end
end
