defmodule IpapyWeb.PictureController do
  use IpapyWeb.Web, :controller

  alias IpapyWeb.Picture

  def index(conn, _params) do
    retirement_home = 
      Repo.get(IpapyWeb.RetirementHome, _params["retirement_home_id"])
      |> Repo.preload(:pictures)
    render(conn, "index.html", retirement_home: retirement_home, pictures: retirement_home.pictures)
  end

  def new(conn, _params) do
    changeset = 
      Repo.get(IpapyWeb.RetirementHome, _params["retirement_home_id"])
      |> build_assoc(:pictures)
      |> Picture.changeset()
    render(conn, "new.html", retirement_home: Repo.get(IpapyWeb.RetirementHome, _params["retirement_home_id"]), changeset: changeset)
  end

  def create(conn, %{"picture" => picture_params, "retirement_home_id" => retirement_home_id}) do
    changeset = 
      Repo.get(IpapyWeb.RetirementHome, retirement_home_id)
      |> build_assoc(:pictures)
      |> Picture.changeset(picture_params)

    case Repo.insert(changeset) do
      {:ok, _picture} ->
        conn
        |> put_flash(:info, "Cette photo a bien été enregistré.")
        |> redirect(to: retirement_home_picture_path(conn, :index, Repo.get(IpapyWeb.RetirementHome, picture_params["retirement_home_id"])))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id, "retirement_home_id" => retirement_home_id}) do
    picture = Repo.get!(Picture, id) |> Repo.preload(:retirement_home)
    changeset = Picture.changeset(picture)
    render(conn, "edit.html", picture: picture, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retirement_home_id" => retirement_home_id, "picture" => picture_params, }) do
    picture = Repo.get!(Picture, id)
    changeset = Picture.changeset(picture, picture_params)

    case Repo.update(changeset) do
      {:ok, picture} ->
        conn
        |> put_flash(:info, "Cette photo a bien été mise à jour.")
        |> redirect(to: retirement_home_picture_path(conn, :index, retirement_home_id))
      {:error, changeset} ->
        render(conn, "edit.html", picture: picture, changeset: changeset)
    end
  end
end
