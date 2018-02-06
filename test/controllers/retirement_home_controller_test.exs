defmodule IpapyWeb.RetirementHomeControllerTest do
  use IpapyWeb.ConnCase

  alias IpapyWeb.RetirementHome
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, retirement_home_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing retirement home"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, retirement_home_path(conn, :new)
    assert html_response(conn, 200) =~ "New retirement home"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, retirement_home_path(conn, :create), retirement_home: @valid_attrs
    retirement_home = Repo.get_by!(RetirementHome, @valid_attrs)
    assert redirected_to(conn) == retirement_home_path(conn, :show, retirement_home.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, retirement_home_path(conn, :create), retirement_home: @invalid_attrs
    assert html_response(conn, 200) =~ "New retirement home"
  end

  test "shows chosen resource", %{conn: conn} do
    retirement_home = Repo.insert! %RetirementHome{}
    conn = get conn, retirement_home_path(conn, :show, retirement_home)
    assert html_response(conn, 200) =~ "Show retirement home"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, retirement_home_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    retirement_home = Repo.insert! %RetirementHome{}
    conn = get conn, retirement_home_path(conn, :edit, retirement_home)
    assert html_response(conn, 200) =~ "Edit retirement home"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    retirement_home = Repo.insert! %RetirementHome{}
    conn = put conn, retirement_home_path(conn, :update, retirement_home), retirement_home: @valid_attrs
    assert redirected_to(conn) == retirement_home_path(conn, :show, retirement_home)
    assert Repo.get_by(RetirementHome, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    retirement_home = Repo.insert! %RetirementHome{}
    conn = put conn, retirement_home_path(conn, :update, retirement_home), retirement_home: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit retirement home"
  end

  test "deletes chosen resource", %{conn: conn} do
    retirement_home = Repo.insert! %RetirementHome{}
    conn = delete conn, retirement_home_path(conn, :delete, retirement_home)
    assert redirected_to(conn) == retirement_home_path(conn, :index)
    refute Repo.get(RetirementHome, retirement_home.id)
  end
end
