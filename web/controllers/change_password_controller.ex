defmodule IpapyWeb.ChangePasswordController do
  use IpapyWeb.Web, :controller

  plug :authenticate when action in [:index, :show]

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"current_password" => current_password, "password" => password, "confirmation_password" => confirmation_password}}) do
    case IpapyWeb.Service.AuthService.change_password(conn, current_password, password, confirmation_password, conn.assigns.current_user, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Le changement du mot de passe s'est bien déroulé")
        |> redirect(to: page_path(conn, :index))
      {:error, :current_password_error, conn} ->
        conn
        |> put_flash(:error, "Le mot de passe courant saisie n'est pas bon")
        |> render("new.html")
      {:error, :confirmation_password_error, conn} ->
        conn 
        |> put_flash(:error, "La confirmation du nouveau mot de passe ne sont pas identique")
        |> render("new.html")
      {:error, :not_update, conn} ->
        conn
        |> put_flash(:error, "Problème de mise à jour du mot de passe")
        |> render("new.html")
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
