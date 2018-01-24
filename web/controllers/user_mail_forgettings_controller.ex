defmodule IpapyWeb.UserMailForgettingsController do
  use IpapyWeb.Web, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => user_params}) do
    #changeset = UserMailForgettings.changeset(%UserMailForgettings{}, user_mail_forgettings_params)

    #case Repo.insert(changeset) do
    #  {:ok, user_mail_forgettings} ->
    #    conn
    #    |> put_flash(:info, "User mail forgettings created successfully.")
    #    |> redirect(to: user_mail_forgettings_path(conn, :show, user_mail_forgettings))
    #  {:error, changeset} ->
    #    render(conn, "new.html", changeset: changeset)
    #end
    #redirect(to: page_path(conn, :index))
  end

end
