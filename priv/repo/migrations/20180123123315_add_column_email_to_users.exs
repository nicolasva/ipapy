defmodule IpapyWeb.Repo.Migrations.AddColumnEmailToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :email, :string, null: false, default: "name@server.com"
    end
  end
end
