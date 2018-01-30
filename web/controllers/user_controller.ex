defmodule IpapyWeb.UserController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.User

  plug :authenticate when action in [:index, :show]

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    #roles = IpapyWeb.Repo.all(IpapyWeb.Role) 
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    #roles = user_params["roles"]

    changeset = User.registration_changeset(%User{}, user_params)


    #roles = user_params["roles"]
    #array_roles = []
    #Enum.each roles,  fn {k, v} ->
      #IO.inspect "#{k} --> #{v}"
      #  IO.inspect k
      #if v = "true" do
        #  role = IpapyWeb.Repo.get(IpapyWeb.Role, k)
        #role = IpapyWeb.Repo.preload(role, :users)
        #array_roles ++ [role]
        #end
        #end
        #changeset = User.registration_changeset(%User{}, user_params)

    #user = IpapyWeb.Repo.preload(changeset, :roles)
    #Ecto.Changeset.change(changeset) |> Ecto.Changeset.put_assoc(:roles, array_roles)

    #IO.inspect changeset
    #user = IpapyWeb.Repo.preload(changeset, :roles)
    #Ecto.Changeset.change(changeset) |> Ecto.Changeset.put_assoc(:roles, array_roles)

    #IO.inspect changeset
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> IpapyWeb.Auth.login(user)
        |> put_flash(:info, "#{user.name} created successfully.")
        |> redirect(to: user_roles_user_path(conn, :new, user))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    #roles = IpapyWeb.Repo.all(IpapyWeb.Role)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
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
