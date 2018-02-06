defmodule IpapyWeb.Role do
  use IpapyWeb.Web, :model

  #ROLES = ["Admin", "Professionel", "Client"]
 
  import EnumsHelper

  enum "role_value" do
    %{ admin: 0, professionnel: 2, client: 3 }
  end

  schema "roles" do
    field :role_value, :integer
    many_to_many :users, IpapyWeb.User, join_through: "roles_users", on_replace: :delete
    timestamps()
  end

  def roles_without_admin do
    query = from role in IpapyWeb.Role,
            where: role.role_value != 0,
            select: role
    IpapyWeb.Repo.all(query)
  end

  def role_value(key) do
    Enum.at(["admin", "professionnel", "client"], key)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end

  def role_value
end
