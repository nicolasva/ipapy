defmodule IpapyWeb.Repo.Migrations.AddColumnPreviewPhotoToPhoto do
  use Ecto.Migration

  def change do
    alter table("pictures") do
      add :preview_photo, :string, null: true, value: false
    end
  end
end
