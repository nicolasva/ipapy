defmodule IpapyWeb.Repo.Migrations.CreateRetirementHome do
  use Ecto.Migration

  def change do
    create table(:retirement_home) do

      timestamps()
    end
  end
end
