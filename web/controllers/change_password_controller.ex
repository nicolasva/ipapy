defmodule IpapyWeb.ChangePasswordController do
  use IpapyWeb.Web, :controller
 
  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => user_params}) do

  end
end
