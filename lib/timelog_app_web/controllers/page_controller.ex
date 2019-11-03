defmodule TimelogAppWeb.PageController do
  use TimelogAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def timesheet(conn, _params) do
    # tasks = TimelogApp.Tasks.list_tasks()
    # render(conn, "timesheet.html", tasks: tasks)
    render(conn, "timesheet.html")
  end
end
