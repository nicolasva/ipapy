defmodule IpapyWeb.RolesUser do
  use IpapyWeb.Web, :model

  schema "roles_user" do

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
