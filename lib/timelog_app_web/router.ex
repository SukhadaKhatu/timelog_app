defmodule TimelogAppWeb.Router do
  use TimelogAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :get_current_user
    # plug :get_manager
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  def get_current_user(conn, _params) do
    user_id = get_session(conn, :user_id)
    # manager = get_session(conn, :manager)
    assign(conn, :current_user, user_id)

    # assign(conn, :manager, manager)
    # IO.inspect(user_id)
    # if user_id do
    #   user = TimelogApp.Users.get_user!(user_id)
    #   assign(conn, :current_user, user)
    # else
    #   assign(conn, :current_user, nil)
    # end
  end

  # def get_manager(conn, _params) do
  #   # conn = fetch_session(conn)
  #   # manager = Plug.Conn.get_session(conn)["user"]
  #   # IO.puts("pleaseeeeeeeeeeeeeeeeee")
  #   # IO.inspect(manager)
  #   # IO.inspect(manager)
  #   # assign(conn, :manager, manager)
  #   # IO.inspect(manager)
  #   # IO.inspect(conn)
  #   user_id = get_session(conn, user_id)
  #   IO.inspect(user_id)
  #   conn
  # end


  scope "/", TimelogAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/timesheet", PageController, :timesheet

    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/timesheets", TimesheetController
    resources "/managers", ManagerController
    resources "/timelogs", TimelogController
    resources "/sessions", SessionController
    resources "/approvals", ApprovalController
    resources "/posts", PostController
    # resources "/requests", RequestController

    # post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimelogAppWeb do
  #   pipe_through :api
  # end
end
