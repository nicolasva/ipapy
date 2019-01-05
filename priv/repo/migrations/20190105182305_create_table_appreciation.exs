defmodule IpapyWeb.Repo.Migrations.CreateTableAppreciation do
  use Ecto.Migration

  def change do
    create table(:appreciations) do
      add :title, :string, null: true
      add :comment, :text, null: false
      add :star_rating, :integer, null: false, default: 0
      add :retirement_home_id, references(:retirement_homes)
      add :user_id, references(:users)
      timestamps()
    end
  end
end
