defmodule IpapyWeb.RetirementHome do
  use IpapyWeb.Web, :model

  schema "retirement_home" do

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
