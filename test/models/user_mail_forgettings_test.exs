defmodule IpapyWeb.UserMailForgettingsTest do
  use IpapyWeb.ModelCase

  alias IpapyWeb.UserMailForgettings

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserMailForgettings.changeset(%UserMailForgettings{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserMailForgettings.changeset(%UserMailForgettings{}, @invalid_attrs)
    refute changeset.valid?
  end
end
