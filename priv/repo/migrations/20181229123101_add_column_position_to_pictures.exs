defmodule IpapyWeb.Repo.Migrations.AddColumnPositionToPictures do
  use Ecto.Migration

  def change do
    alter table("pictures") do
      add :poistion, :integer, null: false, default: 0
    end
  end
end
