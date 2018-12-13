defmodule IpapyWeb.Picture do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  use IpapyWeb.Web, :model
  schema "pictures" do
    field :title, :string
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
    |> cast(params, ~w(title picture), [])
    #|> cast(params, @required_fields, @optional_fields)
    |> validate_required([:retirement_home_id])
    |> cast_attachments(params, [:picture])
  end
end
