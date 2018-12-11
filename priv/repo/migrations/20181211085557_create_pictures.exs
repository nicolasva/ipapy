defmodule IpapyWeb.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :title, :string
      add :picture, :string, null: false
      add :uuid, :string
      add :retirement_home_id, references(:retirement_homes)
      timestamps()
    end
  end
end
