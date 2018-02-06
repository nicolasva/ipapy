defmodule IpapyWeb.RetirementHomeTest do
  use IpapyWeb.ModelCase

  alias IpapyWeb.RetirementHome

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RetirementHome.changeset(%RetirementHome{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RetirementHome.changeset(%RetirementHome{}, @invalid_attrs)
    refute changeset.valid?
  end
end
