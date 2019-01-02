defmodule IpapyWeb.RatingDirectorView do
  use IpapyWeb.Web, :view

  def render("index.json", %{retirement_home: retirement_home}) do
    %{id: retirement_home.id, 
      title: retirement_home.title, 
      detail: retirement_home.detail, 
      rating_director: retirement_home.rating_director
     }
  end
end
