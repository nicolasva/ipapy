defmodule IpapyWeb.Repo.Migrations.ChangeAttributesColumnRoleIntegerToRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      remove :role
      add :role, :integer, null: false, default: 0
    end
  end
end
