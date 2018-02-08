defmodule IpapyWeb.RetirementHome do
  use IpapyWeb.Web, :model

  schema "retirement_homes" do
    field :title, :string
    field :detail, :string
    field :star_rating, :integer
    belongs_to :user, IpapyWeb.User
    timestamps()
  end

  @required_fields ~w(title)
  @optional_fields ~w(detail)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @required_fields, @optional_fields)
    #|> validate_required([])
  end
end
