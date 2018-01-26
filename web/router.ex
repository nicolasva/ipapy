defmodule IpapyWeb.Router do
  use IpapyWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug IpapyWeb.Auth, repo: IpapyWeb.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IpapyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/auth_sessions", AuthSessionController, only: [:new, :create, :delete]
    resources "/user_mail_forgettings", UserMailForgettingsController, only: [:new, :create]
    resources "/change_password", ChangePasswordController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", IpapyWeb do
  #   pipe_through :api
  # end
end
