defmodule IpapyWeb.Role do
  use IpapyWeb.Web, :model

  schema "roles" do
    field :role, :integer, default: 0
    many_to_many :users, IpapyWeb.User, join_through: "roles_users"
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
