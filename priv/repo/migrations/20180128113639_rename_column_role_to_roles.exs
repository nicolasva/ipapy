defmodule IpapyWeb.Repo.Migrations.RenameColumnRoleToRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      remove :role
      add :role_value, :integer, null: false, default: 0
    end
  end
end
