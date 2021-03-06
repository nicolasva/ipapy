defmodule IpapyWeb.UserMailForgettings do
  use IpapyWeb.Web, :model

  schema "user" do

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
