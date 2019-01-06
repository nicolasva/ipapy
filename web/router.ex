defmodule IpapyWeb.Router do
  use IpapyWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug IpapyWeb.Service.AuthService, repo: IpapyWeb.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IpapyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create, :edit, :update] do
      resources "/roles_user", RolesUserController, only: [:new, :create, :edit, :update]
      resources "/retirement_homes", RetirementHomeController, except: [:show]
    end
    resources "/retirement_homes", RetirementHomeController, only: [:show] do
      resources "/appreciations", AppreciationController, only: [:new, :edit, :update, :create]
      resources "/rating_directors", RatingDirectorController, only: [:index, :update]
      resources "/pictures", PictureController, only: [:index, :edit, :update, :new, :create, :delete] do
        resources "/sorts", SortController, only: [:index]
      end
      match :get, "/pictures/sorts", SortController, :index
    end
    post "/roles_user/:id", RolesUserController, :update, as: :roles_user_update
    put "/roles_user/:id", RolesUserController, :update, as: :roles_user
    patch "/roles_user/:id", RolesUserController, :update, as: :roles_user
    get "/roles_user/:id/edit", RolesUserController, :edit, as: :roles_user
    resources "/auth_sessions", AuthSessionController, only: [:new, :create, :delete]
    resources "/user_mail_forgettings", UserMailForgettingsController, only: [:new, :create]
    resources "/change_password", ChangePasswordController, only: [:new, :create]
    resources "/roles", RoleController
  end

  # Other scopes may use custom stacks.
  # scope "/api", IpapyWeb do
  #   pipe_through :api
  # end
end
