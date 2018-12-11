defmodule IpapyWeb.PictureController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Picture

  def index(conn, _params) do
    retirement_home = 
      Repo.get(IpapyWeb.RetirementHome, _params["retirement_home_id"])
      |> Repo.preload(:pictures)
    render(conn, "index.html", pictures: retirement_home.pictures)
  end
end
