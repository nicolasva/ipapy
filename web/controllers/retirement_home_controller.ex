defmodule IpapyWeb.RetirementHomeController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.RetirementHome

  #plug :authenticate when action in [:index, :new, :create]
  
  def index(conn, _params) do
    #retirement_homes = Repo.get_by RetirementHome, user_id: _params["user_id"]
    #retirement_homes = Repo.all(RetirementHome)
    users = 
      Repo.get(IpapyWeb.User, _params["user_id"]) 
      |> Repo.preload([retirement_homes: [:pictures]])
    render(conn, "index.html", retirement_homes: users.retirement_homes)
  end

  def new(conn, _params) do
    #changeset = RetirementHome.changeset(%RetirementHome{user_id: _params["user_id"]})
    changeset = 
      conn.assigns.current_user
      |> build_assoc(:retirement_homes)
      |> Repo.preload(:location)
      |> RetirementHome.changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"retirement_home" => retirement_home_params}) do
    changeset = 
        conn.assigns.current_user
        |> build_assoc(:retirement_homes)
        |> Repo.preload(:location)
        |> RetirementHome.changeset(retirement_home_params)
    #changeset = RetirementHome.changeset(%RetirementHome{}, retirement_home_params)
    
    case Repo.insert(changeset) do
      {:ok, _retirement_home} ->
        conn
        |> put_flash(:info, "Cette maison de retraite a bien été enregistré.")
        |> redirect(to: user_retirement_home_path(conn, :index, conn.assigns.current_user))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retirement_home = Repo.get!(RetirementHome, id)
                      |> Repo.preload([:appreciations, :location])
    changeset = 
      retirement_home
      |> build_assoc(:appreciations)
      |> IpapyWeb.Appreciation.changeset()

    render(conn, "show.html", retirement_home: retirement_home, changeset: changeset)
  end

  def edit(conn, %{"id" => id, "user_id" => user_id}) do
    retirement_home = Repo.get!(RetirementHome, id) |> Repo.preload(:location)
    changeset = RetirementHome.changeset(retirement_home)
    render(conn, "edit.html", retirement_home: retirement_home, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retirement_home" => retirement_home_params}) do
    retirement_home = Repo.get!(RetirementHome, id) |> Repo.preload(:location)
    changeset = RetirementHome.changeset(retirement_home, retirement_home_params)

    case Repo.update(changeset) do
      {:ok, retirement_home} ->
        conn
        |> put_flash(:info, "Retirement home updated successfully.")
        |> redirect(to: user_retirement_home_path(conn, :index, conn.assigns.current_user))
      {:error, changeset} ->
        render(conn, "edit.html", retirement_home: retirement_home, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retirement_home = Repo.get!(RetirementHome, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(retirement_home)

    conn
    |> put_flash(:info, "Retirement home deleted successfully.")
    |> redirect(to: user_retirement_home_path(conn, :index, conn.assigns.current_user))
  end
end
