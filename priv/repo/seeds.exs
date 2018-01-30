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

encrypted_password = Comeonin.Bcrypt.hashpwsalt("infonies")
user = %IpapyWeb.User{name: "VANDENBOGAERDE", username: "Nicolas", encrypted_password: encrypted_password, email: "nicolas.vandenbogaerde@gmail.com", address: "30 Rue François Arago", cp_postal: "93500", city: "PANTIN", country: "France"}
user = IpapyWeb.Repo.insert!(user)

role0 = %IpapyWeb.Role{role_value: 0}
role0 = IpapyWeb.Repo.insert!(role0)

role1 = %IpapyWeb.Role{role_value: 1}
role1 = IpapyWeb.Repo.insert!(role1)

role2 = %IpapyWeb.Role{role_value: 2}
role2 = IpapyWeb.Repo.insert!(role2)

user = IpapyWeb.Repo.get_by(IpapyWeb.User, name: "VANDENBOGAERDE")

role = IpapyWeb.Repo.get_by(IpapyWeb.Role, role_value: 0)

user = IpapyWeb.Repo.preload(user, :roles)

role = IpapyWeb.Repo.preload(role, :users)

changeset = Ecto.Changeset.change(user) |> Ecto.Changeset.put_assoc(:roles, [role])

IpapyWeb.Repo.update!(changeset)


