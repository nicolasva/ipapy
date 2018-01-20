defmodule IpapyWeb.User do
  use IpapyWeb.Web, :model

  schema "users" do 
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    timestamps()
  end
end
