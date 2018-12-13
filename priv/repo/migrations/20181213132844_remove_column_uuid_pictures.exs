defmodule IpapyWeb.Repo.Migrations.RemoveColumnUuidPictures do
  use Ecto.Migration

  def change do
    alter table(:pictures) do
      remove :uuid
    end
  end
end
