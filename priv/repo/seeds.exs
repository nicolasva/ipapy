# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IpapyWeb.Repo.insert!(%IpapyWeb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

changeset = IpapyWeb.Role.changeset(%IpapyWeb.Role{}, %{role: "own"})
IpapyWeb.Repo.insert(changeset)

changeset = IpapyWeb.Role.changeset(%IpapyWeb.Role{}, %{role: "customer"})
IpapyWeb.Repo.insert(changeset)

changeset = IpapyWeb.Role.changeset(%IpapyWeb.Role{}, %{role: "admin"})
IpapyWeb.Repo.insert(changeset)
