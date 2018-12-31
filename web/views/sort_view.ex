defmodule IpapyWeb.SortView do
  use IpapyWeb.Web, :view

  def render("index.json", %{pictures: pictures}) do
    %{pictures: "true"}
  end
end
