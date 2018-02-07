defmodule IpapyWeb.Repo.Migrations.CreateRetirementHome do
  use Ecto.Migration

  def change do
    create table(:retirement_homes) do
      add :title, :string, null: false
      add :detail, :text
      add :star_rating, :integer
      add :user_id, references(:users)
      timestamps()
    end
  end
end
