defmodule IpapyWeb.PageController do
  use IpapyWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
