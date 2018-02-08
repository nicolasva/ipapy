defmodule IpapyWeb.RetirementHomeController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.RetirementHome

  def index(conn, _params) do
    retirement_home = Repo.all(RetirementHome)
    render(conn, "index.html", retirement_home: retirement_home)
  end

  def new(conn, _params) do
    #changeset = RetirementHome.changeset(%RetirementHome{})
    changeset = 
      conn.assigns.current_user
      |> build_assoc(:retirement_homes)
      |> RetirementHome.changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"retirement_home" => retirement_home_params}) do
      changeset = 
        conn.assigns.current_user
        |> build_assoc(:retirement_homes)
        |> RetirementHome.changeset(retirement_home_params)

      case Repo.insert(changeset) do
        {:ok, _retirement_home} ->
          conn
          |> put_flash(:info, "Cette maison de retraite a bien été enregistré.")
          |> redirect(to: user_retirement_home_path(conn, :show, conn.assigns.current_user, _retirement_home))
        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
  end

  def show(conn, %{"id" => id}) do
    retirement_home = Repo.get!(RetirementHome, id)
    render(conn, "show.html", retirement_home: retirement_home)
  end

  def edit(conn, %{"id" => id}) do
    retirement_home = Repo.get!(RetirementHome, id)
    changeset = RetirementHome.changeset(retirement_home)
    render(conn, "edit.html", retirement_home: retirement_home, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retirement_home" => retirement_home_params}) do
    retirement_home = Repo.get!(RetirementHome, id)
    changeset = RetirementHome.changeset(retirement_home, retirement_home_params)

    case Repo.update(changeset) do
      {:ok, retirement_home} ->
        conn
        |> put_flash(:info, "Retirement home updated successfully.")
        |> redirect(to: user_retirement_home_path(conn, :show, conn.assigns.current_user, retirement_home))
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
