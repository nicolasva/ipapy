defmodule IpapyWeb.RetirementHome do
  use IpapyWeb.Web, :model

  schema "retirement_homes" do
    field :title, :string
    field :detail, :string
    field :star_rating, :integer
    field :rating_director, :integer
    field :rating_1, :integer, virtual: true
    field :rating_2, :integer, virtual: true
    field :rating_3, :integer, virtual: true
    field :rating_4, :integer, virtual: true
    field :rating_5, :integer, virtual: true
    belongs_to :user, IpapyWeb.User
    has_many :appreciations, IpapyWeb.Appreciation, on_delete: :delete_all
    has_many :pictures, IpapyWeb.Picture, on_delete: :delete_all
    has_one :location, IpapyWeb.Location
    timestamps()
  end

  @required_fields ~w(title, user_id)
  @optional_fields ~w(detail)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title detail rating_director), [])
    #|> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:location)
    |> validate_required([:title, :detail, :user_id])
  end
end
