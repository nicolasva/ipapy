defmodule IpapyWeb.SortController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Picture

  def index(conn, %{"retirement_home_id" => retirement_home_id, "pictures" => pictures}) do
    #IO.inspect "-=-=-=-=-=-=-=-=-=-#{pictures}-=-=-=-=-=-=-=-"
    Enum.with_index(pictures, 1) 
    |> Enum.reduce(%{}, fn({id,index}, acc)-> Picture.position(index+1, id) end)
    
    #pictures = 
    #  from(picture in IpapyWeb.Picture, where: picture.retirement_home_id == 4, order_by: picture.position) 
    #  |> IpapyWeb.Repo.all
    #render(conn, "index.json", pictures: pictures)
    #json conn, %{pictures: "true"}
    render(conn, "index.json", pictures: "true")
  end
end
