defmodule IpapyWeb.AppreciationController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Appreciation

  def new(conn, %{"retirement_home_id" => retirement_home_id}) do
    retirement_home = Repo.get!(IpapyWeb.RetirementHome, 11)
                      |> Repo.preload([[appreciations: :user], :location, :pictures])
    changeset =
      retirement_home
      |> build_assoc(:appreciations)
      |> IpapyWeb.Appreciation.changeset()

    render(conn, "new.html", retirement_home: retirement_home, changeset: changeset)
  end

  def create(conn, %{"appreciation" => appreciation_params, "retirement_home_id" => retirement_home_id}) do
    retirement_home = Repo.get!(IpapyWeb.RetirementHome, retirement_home_id)
                      |> Repo.preload([[appreciations: :user], :location, :pictures])
    changeset =
      retirement_home 
      |> build_assoc(:appreciations, user_id: conn.assigns.current_user.id)
      |> IpapyWeb.Appreciation.changeset(appreciation_params)
      #|> force_change(:user_id, conn.assigns.current_user.id)

    case Repo.insert(changeset) do
      {:ok, _appreciation} ->
        conn
        |> put_flash(:info, "Cette appréciation a bien été enregistré.")
        |> redirect(to: retirement_home_path(conn, :show, retirement_home_id))
      {:error, changeset} ->
        conn
        #|> redirect(to: retirement_home_path(conn, :show, retirement_home_id))
        |> render("new.html", changeset: changeset, retirement_home: retirement_home)
        #conn
        #|> redirect(to: retirement_home_appreciation_path(conn, :new, retirement_home_id))
    end
  end
end
