defmodule IpapyWeb.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role, :string, null: false, default: 0
      timestamps()
    end
  end
end
