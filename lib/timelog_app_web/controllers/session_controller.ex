defmodule TimelogAppWeb.SessionController do
    use TimelogAppWeb, :controller
    

    def new(conn, _params) do
      render(conn, "new.html")
  end

    # def create(conn,%{"email"=>email}) do
      # user = TimelogApp.Users.get_user_by_email(email)
    def create(conn, %{"email" => email, "password" => password, "manager" => manager}) do
      # IO.puts("manager")
      # IO.inspect(manager)
      # IO.puts("name")
      # IO.inspect(email)
      # IO.puts("password")
      # IO.inspect(password)
      # new_manager = JSON.parse(manager)
    #   if manager == "true" do
    #     IO.puts("inside this");
    #     manager = TimelogApp.Managers.authenticate(email, password)
    #     IO.inspect(manager)
    #     # conn |> put_session(:manager, "true")
    #     # manager = %{"manager_id" => manager.id}
    #     if manager do
    #       # assign(conn, :current_user, manager)
    #       # IO.inspect("dljasfldjslf")
    #       # IO.inspect(manager)
    #       conn
    #       |> put_session(:user_id, manager.id)
    #       |> put_flash(:info, "Welcome back, #{manager.name}")
    #       |> redirect(to: Routes.timelog_path(conn, :index))
    #   else
    #       conn
    #       |> put_flash(:error, "Can't create session")
    #       |> redirect(to: Routes.page_path(conn, :index))      
    #   end
    #   else
    #     user = TimelogApp.Users.authenticate(email, password)
    #     IO.inspect(user)
    #     # conn |> assign(:manager, "false")
    #     # user = TimelogApp.Users.get_user_by_email(email)
    #     if user do
    #       # assign(conn, :current_user, user)
    #       conn
    #       |> put_session(:user_id, user.id)
    #       |> put_flash(:info, "Welcome back, #{user.name}")
    #       |> redirect(to: Routes.timelog_path(conn, :index))
          
    #   else
    #       conn
    #       |> put_flash(:error, "Can't create session")
    #       |> redirect(to: Routes.page_path(conn, :index))      
    #   end
    # end
      # end
      # IO.puts("user email")
      # IO.inspect(user)
      # all = TimelogApp.Users.list_users()
      # IO.inspect(all)

      user = TimelogApp.Users.authenticate(email, password)
        IO.inspect(user)
        # conn |> assign(:manager, "false")
        # user = TimelogApp.Users.get_user_by_email(email)
        if user do
          # assign(conn, :current_user, user)
          conn
          |> put_session(:user_id, user)
          |> put_flash(:info, "Welcome back, #{user.name}")
          |> redirect(to: Routes.timelog_path(conn, :index))
          
      else
          conn
          |> put_flash(:error, "Can't create session")
          |> redirect(to: Routes.page_path(conn, :index))      
      end
      
    end

    # def create(conn, %{"email" => email, "password" => password}) do
    #   # user = Lens.Users.authenticate(email, password)
    #   IO.inspect(email)
    #   IO.inspect(password)
    #   user = TimelogApp.Users.get_user_by_email(email)

    #   if user do
    #     conn
    #     |> put_session(:user_id, user.id)
    #     |> put_flash(:info, "Welcome back #{user.email}")
    #     |> redirect(to: Routes.page_path(conn, :index))
    #   else
    #     conn
    #     |> put_flash(:error, "Login failed.")
    #     |> redirect(to: Routes.page_path(conn, :index))
    #   end
    #   # IO.puts("here")
    # end
  
    def delete(conn, _params) do
      conn
      |> delete_session(:user_id)
      |> put_flash(:info, "Logged out")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end