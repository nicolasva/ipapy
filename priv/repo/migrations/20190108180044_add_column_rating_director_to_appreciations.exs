defmodule IpapyWeb.Repo.Migrations.AddColumnRatingDirectorToAppreciations do
  use Ecto.Migration

  def change do
    alter table("appreciations") do
      add :rating_director, :integer, null: false, default: 0
    end
  end
end
