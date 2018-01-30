defmodule IpapyWeb.RolesUserControllerTest do
  use IpapyWeb.ConnCase

  alias IpapyWeb.RolesUser
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, roles_user_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing roles user"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, roles_user_path(conn, :new)
    assert html_response(conn, 200) =~ "New roles user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, roles_user_path(conn, :create), roles_user: @valid_attrs
    roles_user = Repo.get_by!(RolesUser, @valid_attrs)
    assert redirected_to(conn) == roles_user_path(conn, :show, roles_user.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, roles_user_path(conn, :create), roles_user: @invalid_attrs
    assert html_response(conn, 200) =~ "New roles user"
  end

  test "shows chosen resource", %{conn: conn} do
    roles_user = Repo.insert! %RolesUser{}
    conn = get conn, roles_user_path(conn, :show, roles_user)
    assert html_response(conn, 200) =~ "Show roles user"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, roles_user_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    roles_user = Repo.insert! %RolesUser{}
    conn = get conn, roles_user_path(conn, :edit, roles_user)
    assert html_response(conn, 200) =~ "Edit roles user"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    roles_user = Repo.insert! %RolesUser{}
    conn = put conn, roles_user_path(conn, :update, roles_user), roles_user: @valid_attrs
    assert redirected_to(conn) == roles_user_path(conn, :show, roles_user)
    assert Repo.get_by(RolesUser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    roles_user = Repo.insert! %RolesUser{}
    conn = put conn, roles_user_path(conn, :update, roles_user), roles_user: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit roles user"
  end

  test "deletes chosen resource", %{conn: conn} do
    roles_user = Repo.insert! %RolesUser{}
    conn = delete conn, roles_user_path(conn, :delete, roles_user)
    assert redirected_to(conn) == roles_user_path(conn, :index)
    refute Repo.get(RolesUser, roles_user.id)
  end
end
