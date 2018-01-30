defmodule IpapyWeb.Repo.Migrations.RemoveColumnInsertedAtAndUpdatedAtToRole do
  use Ecto.Migration

  def change do
    alter table(:roles_users) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
