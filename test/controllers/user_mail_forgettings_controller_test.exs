defmodule IpapyWeb.UserMailForgettingsControllerTest do
  use IpapyWeb.ConnCase

  alias IpapyWeb.UserMailForgettings
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_mail_forgettings_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing user"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_mail_forgettings_path(conn, :new)
    assert html_response(conn, 200) =~ "New user mail forgettings"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_mail_forgettings_path(conn, :create), user_mail_forgettings: @valid_attrs
    user_mail_forgettings = Repo.get_by!(UserMailForgettings, @valid_attrs)
    assert redirected_to(conn) == user_mail_forgettings_path(conn, :show, user_mail_forgettings.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_mail_forgettings_path(conn, :create), user_mail_forgettings: @invalid_attrs
    assert html_response(conn, 200) =~ "New user mail forgettings"
  end

  test "shows chosen resource", %{conn: conn} do
    user_mail_forgettings = Repo.insert! %UserMailForgettings{}
    conn = get conn, user_mail_forgettings_path(conn, :show, user_mail_forgettings)
    assert html_response(conn, 200) =~ "Show user mail forgettings"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user_mail_forgettings_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    user_mail_forgettings = Repo.insert! %UserMailForgettings{}
    conn = get conn, user_mail_forgettings_path(conn, :edit, user_mail_forgettings)
    assert html_response(conn, 200) =~ "Edit user mail forgettings"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    user_mail_forgettings = Repo.insert! %UserMailForgettings{}
    conn = put conn, user_mail_forgettings_path(conn, :update, user_mail_forgettings), user_mail_forgettings: @valid_attrs
    assert redirected_to(conn) == user_mail_forgettings_path(conn, :show, user_mail_forgettings)
    assert Repo.get_by(UserMailForgettings, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user_mail_forgettings = Repo.insert! %UserMailForgettings{}
    conn = put conn, user_mail_forgettings_path(conn, :update, user_mail_forgettings), user_mail_forgettings: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user mail forgettings"
  end

  test "deletes chosen resource", %{conn: conn} do
    user_mail_forgettings = Repo.insert! %UserMailForgettings{}
    conn = delete conn, user_mail_forgettings_path(conn, :delete, user_mail_forgettings)
    assert redirected_to(conn) == user_mail_forgettings_path(conn, :index)
    refute Repo.get(UserMailForgettings, user_mail_forgettings.id)
  end
end
