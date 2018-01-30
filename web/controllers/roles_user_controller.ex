defmodule IpapyWeb.RolesUserController do
  use IpapyWeb.Web, :controller

  #alias IpapyWeb.RolesUser

  def index(conn, _params) do
    roles_user = Repo.all(RolesUser)
    render(conn, "index.html", roles_user: roles_user)
  end

  def new(conn, _params) do
    #user_id = _params["user_id"]
    user = IpapyWeb.Repo.get!(IpapyWeb.User, _params["user_id"])
    roles = IpapyWeb.Repo.all(IpapyWeb.Role)
    #changeset = RolesUser.changeset(%RolesUser{})
    render(conn, "new.html", user: user, roles: roles)
  end

  def create(conn, %{"roles" => roles_user_params}) do
    #changeset = RolesUser.changeset(%RolesUser{}, roles_user_params)

    #case Repo.insert(changeset) do
    #  {:ok, roles_user} ->
      #    conn
      #  |> put_flash(:info, "Roles user created successfully.")
      #  |> redirect(to: user_roles_user_path(conn, :show, roles_user))
    #{:error, changeset} ->
      #   render(conn, "new.html", changeset: changeset)
      #end
  end


  #def edit(conn, %{"id" => id}) do
    #roles_user = Repo.get!(RolesUser, id)
    #changeset = RolesUser.changeset(roles_user)
    #render(conn, "edit.html", roles_user: roles_user, changeset: changeset)
  #end

  #def update(conn, %{"id" => id, "roles_user" => roles_user_params}) do
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
  #end

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
