defmodule IpapyWeb.AuthSessionController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.User

  def new(conn, _)
    render conn, "new.html"
  end

  def create(conn, %{"auth_session" => %{"username" => user, "password" => pass}}) do
    case IpapyWeb.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username|password combination")
        |> render("new.html")
    end
  end
end