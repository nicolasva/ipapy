defmodule IpapyWeb.RolesUserController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Role

  def index(conn, _params) do
    roles_user = Repo.all(RolesUser)
    render(conn, "index.html", roles_user: roles_user)
  end

  def new(conn, _params) do
    #user_id = _params["user_id"]
    user = IpapyWeb.Repo.get!(IpapyWeb.User, _params["user_id"])
    roles = IpapyWeb.Role.roles_without_admin
    #changeset = RolesUser.changeset(%RolesUser{})
    render(conn, "new.html", user: user, roles: roles)
  end

  def create(conn, %{"user_id" => user_id, "role" => role}) do
    #changeset = RolesUser.changeset(%RolesUser{}, roles)
    case IpapyWeb.Service.RolesUsers.assoc_roles_users(conn, [role], user_id) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Vous avez bien été enregistré dans ces catégories utilisateurs")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "vous n'avez pas été enregistré dans cette catégorie utilisateur")
        |> render("new.html")
    end
    #case Repo.insert(changeset) do
    #  {:ok, roles_user} ->
      #    conn
      #  |> put_flash(:info, "Roles user created successfully.")
      #  |> redirect(to: user_roles_user_path(conn, :show, roles_user))
    #{:error, changeset} ->
      #   render(conn, "new.html", changeset: changeset)
      #end
  end


  def edit(conn, %{"id" => user_id}) do
    roles = IpapyWeb.Role.roles_without_admin
    #roles_user = Repo.get!(RolesUser, id)
    #changeset = RolesUser.changeset(roles_user)
    #render(conn, "edit.html", roles_user: roles_user, changeset: changeset)
    render(conn, "edit.html", user: conn.assigns.current_user, roles: roles)
  end

  def update(conn, %{"id" => id, "roles_user" => roles_user_params}) do
    #roles_user = Repo.get!(RolesUser, id)
    #changeset = RolesUser.changeset(roles_user, roles_user_params)

    #case Repo.update(changeset) do
    #  {:ok, roles_user} ->
      #    conn
      #  |> put_flash(:info, "Roles user updated successfully.")
        #|> redirect(to: roles_user_path(conn, :show, roles_user))
    #{:error, changeset} ->
      #    render(conn, "edit.html", roles_user: roles_user, changeset: changeset)
      #end
  end

  #def delete(conn, %{"id" => id}) do
    #roles_user = Repo.get!(RolesUser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    #Repo.delete!(roles_user)

    #conn
    #|> put_flash(:info, "Roles user deleted successfully.")
    #|> redirect(to: roles_user_path(conn, :index))
    #end
end
