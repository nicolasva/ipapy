defmodule IpapyWeb.Repo.Migrations.AddColumnRatingDirectorToRetirementHomes do
  use Ecto.Migration

  def change do
    alter table("retirement_homes") do
      add :rating_director, :integer, null: false, default: 0
    end
  end
end
