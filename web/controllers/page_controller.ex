defmodule IpapyWeb.PageController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.RetirementHome

  def index(conn, _params) do
    retirement_homes =
      from(retirement_home in IpapyWeb.RetirementHome, where: retirement_home.rating_director <= 5, where: retirement_home.rating_director >= 3, limit: 10)
      |> IpapyWeb.Repo.all
      
    render conn, "index.html", retirement_homes: retirement_homes
  end
end
