defmodule IpapyWeb.Appreciation do
  use IpapyWeb.Web, :model

  schema "appreciations" do
    field :title, :string
    field :comment, :string
    belongs_to :retirement_home_id, IpapyWeb.RetirementHome
    belongs_to :user_id, IpapyWeb.User
    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(title comment), [])
    |> validate_required([:title, :comment, :retirement_home_id, :user_id])
  end

  defp set_user(changeset) do
    force_change(changeset, :user_id, conn.assigns.current_user.id)
  end
end
