defmodule IpapyWeb.RolesUserTest do
  use IpapyWeb.ModelCase

  alias IpapyWeb.RolesUser

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RolesUser.changeset(%RolesUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RolesUser.changeset(%RolesUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
