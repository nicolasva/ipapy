defmodule IpapyWeb.RolesUserController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Role

  def index(conn, _params) do
    roles_user = Repo.all(RolesUser)
    render(conn, "index.html", roles_user: roles_user)
  end

  def new(conn, _params) do
    user = IpapyWeb.Repo.get!(IpapyWeb.User, _params["user_id"])
    roles = IpapyWeb.Role.roles_without_admin
    render(conn, "new.html", user: user, roles: roles)
  end

  def create(conn, %{"user_id" => user_id, "role" => role}) do
    case IpapyWeb.Service.RolesUsersService.assoc_roles_users(conn, [role], user_id) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Vous avez bien été enregistré dans ces catégories utilisateurs")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "vous n'avez pas été enregistré dans cette catégorie utilisateur")
        |> render("new.html")
    end
  end


  def edit(conn, %{"id" => user_id}) do
    roles = IpapyWeb.Role.roles_without_admin
    render(conn, "edit.html", user: conn.assigns.current_user, roles: roles)
  end

  def update(conn, %{"id" => user_id, "role" => role}) do
    case IpapyWeb.Service.RolesUsersService.assoc_roles_users(conn, [role], user_id) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Vous avez bien été enregistré dans ces catégories utilisateurs")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "vous n'avez pas été enregistré dans cette catégorie utilisateur")
        |> render("new.html")
    end
  end
end
