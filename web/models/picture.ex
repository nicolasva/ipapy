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
    |> preview_photo_params(model)
    #|> cast(params, @required_fields, @optional_fields)
    |> validate_required([:retirement_home_id])
    |> cast_attachments(params, [:picture])
  end

  def preview_picture(retirement_home_id) do
    picture = from(p in IpapyWeb.Picture, where: p.retirement_home_id == ^retirement_home_id, where: p.preview_photo == "true", limit: 1) |> IpapyWeb.Repo.one
  end

  defp preview_photo_params(changeset, model) do
    try do
      if model.preview_photo == "true" do
        retirement_home_id = model.retirement_home_id
        from(p in IpapyWeb.Picture, where: p.retirement_home_id == ^retirement_home_id, update: [set: [preview_photo: "false"]]) |> IpapyWeb.Repo.update_all([])
      end
      changeset
    rescue
      x -> changeset
    end
  end
end
