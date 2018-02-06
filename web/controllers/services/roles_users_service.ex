defmodule IpapyWeb.Service.RolesUsers do
  import Plug.Conn

  def assoc_roles_users(conn, role, user_id) do
    IO.inspect "user_id -=-=-=-=-=-=-=-=-=--#{user_id}"
    roles = Enum.at(role, 0)
    user = IpapyWeb.Repo.get!(IpapyWeb.User, user_id)
    user = IpapyWeb.Repo.preload(user, :roles)
    roles = :maps.filter fn _, v -> v != "false" end, roles["roles"]
    roles = Map.keys(roles)
    array_roles = Enum.map(roles, fn(x) -> IpapyWeb.Repo.preload(IpapyWeb.Repo.get(IpapyWeb.Role, x), :users) end)
    changeset = Ecto.Changeset.change(user) |> Ecto.Changeset.put_assoc(:roles, array_roles)
    if IpapyWeb.Repo.update!(changeset) do
      {:ok, conn}
    else
      {:error, :error_roles_users, conn}
    end
  end
end
