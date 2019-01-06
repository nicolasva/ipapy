defmodule IpapyWeb.AppreciationController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Appreciation

  def create(conn, %{"appreciation" => appreciation_params, "retirement_home_id" => retirement_home_id}) do
    changeset =
      Repo.get!(IpapyWeb.RetirementHome, retirement_home_id)
      |> build_assoc(:appreciations)
      |> IpapyWeb.RetirementHome.changeset(appreciation_params)

    case Repo.insert(changeset) do
      {:ok, _retirement_home} ->
        conn
        |> put_flash(:info, "Cette appréciation a bien été enregistré.")
        |> redirect(to: retirement_home_path(conn, :show, retirement_home_id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
