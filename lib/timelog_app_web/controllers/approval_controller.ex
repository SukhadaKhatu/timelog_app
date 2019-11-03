defmodule TimelogAppWeb.ApprovalController do
  use TimelogAppWeb, :controller

  alias TimelogApp.Approvals
  alias TimelogApp.Approvals.Approval

  def index(conn, _params) do
    approvals = Approvals.list_approvals()
    render(conn, "index.html", approvals: approvals)
  end

  def new(conn, _params) do
    changeset = Approvals.change_approval(%Approval{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"approval" => approval_params}) do
    case Approvals.create_approval(approval_params) do
      {:ok, approval} ->
        conn
        |> put_flash(:info, "Approval created successfully.")
        |> redirect(to: Routes.approval_path(conn, :show, approval))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    approval = Approvals.get_approval!(id)
    render(conn, "show.html", approval: approval)
  end

  def edit(conn, %{"id" => id}) do
    approval = Approvals.get_approval!(id)
    changeset = Approvals.change_approval(approval)
    render(conn, "edit.html", approval: approval, changeset: changeset)
  end

  def update(conn, %{"id" => id, "approval" => approval_params}) do
    approval = Approvals.get_approval!(id)

    case Approvals.update_approval(approval, approval_params) do
      {:ok, approval} ->
        conn
        |> put_flash(:info, "Approval updated successfully.")
        |> redirect(to: Routes.approval_path(conn, :show, approval))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", approval: approval, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    approval = Approvals.get_approval!(id)
    {:ok, _approval} = Approvals.delete_approval(approval)

    conn
    |> put_flash(:info, "Approval deleted successfully.")
    |> redirect(to: Routes.approval_path(conn, :index))
  end
end
