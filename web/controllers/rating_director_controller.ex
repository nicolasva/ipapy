defmodule IpapyWeb.RatingDirectorController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.RetirementHome

  def index(conn, %{"retirement_home_id" => retirement_home_id}) do
    retirement_home = 
      Repo.get(IpapyWeb.RetirementHome, retirement_home_id)
      #json conn, %{retirement_home: retirement_home}
      render(conn, "index.json", retirement_home: retirement_home)
  end

  def update(conn, %{"retirement_home_id" => retirement_home_id, "rating_director" => rating_director}) do

  end
end
