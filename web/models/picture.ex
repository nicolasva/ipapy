defmodule IpapyWeb.Picture do
  use IpapyWeb.Web, :model
  schema "pictures" do
    field :title, :string
    field :picture, :string
    field :uuid, :string
    belongs_to :retirement_home, IpapyWeb.RetirementHome
    timestamps()
  end

  @required_fields ~w(picture, retirement_home_id)
  @optional_fields ~w(title, uuid)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title picture uuid), [])
    #|> cast(params, @required_fields, @optional_fields)
    |> validate_required([:picture, :retirement_home_id])
  end
end
