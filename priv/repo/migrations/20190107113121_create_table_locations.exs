defmodule IpapyWeb.Repo.Migrations.CreateTableLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string, null: false
      add :cp_postal, :string, null: false
      add :city, :string, null: false
      add :country, :string, null: false
      add :retirement_home_id, references(:retirement_homes)
      timestamps()
    end
    create unique_index(:locations, [:retirement_home_id])
  end
end
