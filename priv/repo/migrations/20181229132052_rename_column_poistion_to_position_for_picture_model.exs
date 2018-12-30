defmodule IpapyWeb.Repo.Migrations.RenameColumnPoistionToPositionForPictureModel do
  use Ecto.Migration

  def change do
    rename table(:pictures), :poistion, to: :position
  end
end
