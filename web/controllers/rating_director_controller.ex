defmodule IpapyWeb.RatingDirectorController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.RetirementHome

  def index(conn, %{"retirement_home_id" => retirement_home_id}) do
    retirement_home = 
      Repo.get(IpapyWeb.RetirementHome, retirement_home_id)
      #json conn, %{retirement_home: retirement_home}
      render(conn, "index.json", retirement_home: retirement_home)
  end

  def update(conn, %{"retirement_home_id" => retirement_home_id, "id" => rating_director, "retirement_home" => retirement_home_params}) do
    retirement_home = Repo.get!(RetirementHome, retirement_home_id)
    changeset = RetirementHome.changeset(retirement_home, retirement_home_params)
    Repo.update(changeset)
    render(conn, "index.json", retirement_home: retirement_home)
  end
end
