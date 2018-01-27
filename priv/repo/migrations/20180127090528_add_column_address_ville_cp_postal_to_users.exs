defmodule IpapyWeb.Repo.Migrations.AddColumnAddressVilleCpPostalToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :address, :string, null: false, default: "Address"
      add :cp_postal, :string, null: false, default: "CP postal"
      add :city, :string, null: false, default: "City"
      add :country, :string, null: false, default: "Country"
    end
  end
end
