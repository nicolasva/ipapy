defmodule IpapyWeb.Repo.Migrations.ChnageTypeColumnRoleToRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      remove :role_value
      add :role_value, :string
    end
  end
end
