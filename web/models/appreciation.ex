defmodule IpapyWeb.Appreciation do
  use IpapyWeb.Web, :model

  schema "appreciations" do
    field :title, :string
    field :comment, :string
    belongs_to :retirement_home, IpapyWeb.RetirementHome
    belongs_to :user, IpapyWeb.User
    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title comment), [])
    |> validate_required([:title, :comment])
  end
end
