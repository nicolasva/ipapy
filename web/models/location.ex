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
end
