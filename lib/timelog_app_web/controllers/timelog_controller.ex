defmodule TimelogAppWeb.TimelogController do
  use TimelogAppWeb, :controller

  alias TimelogApp.Timelogs
  alias TimelogApp.Timelogs.Timelog

  def index(conn, _params) do
    timelogs = Timelogs.list_timelogs()
    render(conn, "index.html", timelogs: timelogs)
  end

  def new(conn, _params) do
    changeset = Timelogs.change_timelog(%Timelog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timelog" => timelog_params}) do
    case Timelogs.create_timelog(timelog_params) do
      {:ok, timelog} ->
        conn
        |> put_flash(:info, "Timelog created successfully.")
        |> redirect(to: Routes.timelog_path(conn, :show, timelog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timelog = Timelogs.get_timelog!(id)
    render(conn, "show.html", timelog: timelog)
  end

  def edit(conn, %{"id" => id}) do
    timelog = Timelogs.get_timelog!(id)
    changeset = Timelogs.change_timelog(timelog)
    render(conn, "edit.html", timelog: timelog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timelog" => timelog_params}) do
    timelog = Timelogs.get_timelog!(id)

    case Timelogs.update_timelog(timelog, timelog_params) do
      {:ok, timelog} ->
        conn
        |> put_flash(:info, "Timelog updated successfully.")
        |> redirect(to: Routes.timelog_path(conn, :show, timelog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timelog: timelog, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timelog = Timelogs.get_timelog!(id)
    {:ok, _timelog} = Timelogs.delete_timelog(timelog)

    conn
    |> put_flash(:info, "Timelog deleted successfully.")
    |> redirect(to: Routes.timelog_path(conn, :index))
  end
end
