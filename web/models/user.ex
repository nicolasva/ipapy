defmodule IpapyWeb.User do
  use IpapyWeb.Web, :model

  schema "users" do 
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_encrypted_password()
  end

  defp put_encrypted_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
