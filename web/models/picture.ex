defmodule IpapyWeb.Picture do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  use IpapyWeb.Web, :model
  schema "pictures" do
    field :title, :string
    field :preview_photo, :string
    field :picture, IpapyWeb.PictureUploader.Type
    belongs_to :retirement_home, IpapyWeb.RetirementHome
    timestamps()
  end

  @required_fields ~w(picture, retirement_home_id)
  @optional_fields ~w(title)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title preview_photo picture), [])
    |> change_preview_photo
    |> preview_photo_params
    #|> cast(params, @required_fields, @optional_fields)
    |> validate_required([:retirement_home_id])
    |> cast_attachments(params, [:picture])
  end

  defp change_preview_photo(changeset) do
    retirement_home_id = get_field(changeset, :retirement_home_id)
    case count_pictures_by_retirement_home(retirement_home_id) do
      0 ->
        force_change(changeset, :preview_photo, "true")
      _ ->
        changeset
    end
  end

  def preview_picture(retirement_home_id) do
    picture = from(p in IpapyWeb.Picture, where: p.retirement_home_id == ^retirement_home_id, where: p.preview_photo == "true", limit: 1) |> IpapyWeb.Repo.one
    if picture do
      IpapyWeb.PictureUploader.url({picture.picture, picture}, :thumb)
    end
  end

  defp preview_photo_params(changeset) do
    preview_photo = get_field(changeset, :preview_photo)
    retirement_home_id = get_field(changeset, :retirement_home_id)
    if preview_photo == "true"  do
      from(p in IpapyWeb.Picture, where: p.retirement_home_id == ^retirement_home_id, update: [set: [preview_photo: "false"]]) |> IpapyWeb.Repo.update_all([])
    end
    changeset
  end

  defp count_pictures_by_retirement_home(retirement_home_id) do
    from(p in IpapyWeb.Picture, where: p.retirement_home_id == ^retirement_home_id, select: count(p.id)) |> IpapyWeb.Repo.one
  end
end
