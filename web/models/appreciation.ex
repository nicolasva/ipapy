defmodule IpapyWeb.Appreciation do
  use IpapyWeb.Web, :model

  schema "appreciations" do
    field :title, :string
    field :comment, :string
    field :rating_director, :integer
    field :rating_1, :integer, virtual: true
    field :rating_2, :integer, virtual: true
    field :rating_3, :integer, virtual: true
    field :rating_4, :integer, virtual: true
    field :rating_5, :integer, virtual: true
    belongs_to :retirement_home, IpapyWeb.RetirementHome
    belongs_to :user, IpapyWeb.User
    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title comment rating_director), [])
    |> validate_required([:title, :comment])
  end
end
