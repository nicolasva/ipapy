defmodule IpapyWeb.Repo.Migrations.RemoveColumnStarRatingToAppreciation do
  use Ecto.Migration

  def change do
    alter table(:appreciations) do
      remove :star_rating
    end
  end
end
