defmodule IpapyWeb.UserMailForgettingsController do
  use IpapyWeb.Web, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"email" => email}}) do
    case IpapyWeb.Auth.losing_password(conn, email, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Mot de passe envoyé")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid Email")
        |> render("new.html")
    end
  end

end
