defmodule IpapyWeb.Location do
  use IpapyWeb.Web, :model

  schema "locations" do
    field :address, :string
    field :cp_postal, :string
    field :city, :string
    field :country, :string
    belongs_to :retirement_home, IpapyWeb.RetirementHome
    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(address cp_postal city country), [])
    |> cast_assoc(:retirement_home)
    |> validate_required([:address, :cp_postal, :city, :country])
  end
end
