defmodule TimelogAppWeb.ApprovalControllerTest do
  use TimelogAppWeb.ConnCase

  alias TimelogApp.Approvals

  @create_attrs %{approved: true, desc: "some desc", manager: 42, name: "some name", time: 42, user: 42}
  @update_attrs %{approved: false, desc: "some updated desc", manager: 43, name: "some updated name", time: 43, user: 43}
  @invalid_attrs %{approved: nil, desc: nil, manager: nil, name: nil, time: nil, user: nil}

  def fixture(:approval) do
    {:ok, approval} = Approvals.create_approval(@create_attrs)
    approval
  end

  describe "index" do
    test "lists all approvals", %{conn: conn} do
      conn = get(conn, Routes.approval_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Approvals"
    end
  end

  describe "new approval" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.approval_path(conn, :new))
      assert html_response(conn, 200) =~ "New Approval"
    end
  end

  describe "create approval" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.approval_path(conn, :create), approval: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.approval_path(conn, :show, id)

      conn = get(conn, Routes.approval_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Approval"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.approval_path(conn, :create), approval: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Approval"
    end
  end

  describe "edit approval" do
    setup [:create_approval]

    test "renders form for editing chosen approval", %{conn: conn, approval: approval} do
      conn = get(conn, Routes.approval_path(conn, :edit, approval))
      assert html_response(conn, 200) =~ "Edit Approval"
    end
  end

  describe "update approval" do
    setup [:create_approval]

    test "redirects when data is valid", %{conn: conn, approval: approval} do
      conn = put(conn, Routes.approval_path(conn, :update, approval), approval: @update_attrs)
      assert redirected_to(conn) == Routes.approval_path(conn, :show, approval)

      conn = get(conn, Routes.approval_path(conn, :show, approval))
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, approval: approval} do
      conn = put(conn, Routes.approval_path(conn, :update, approval), approval: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Approval"
    end
  end

  describe "delete approval" do
    setup [:create_approval]

    test "deletes chosen approval", %{conn: conn, approval: approval} do
      conn = delete(conn, Routes.approval_path(conn, :delete, approval))
      assert redirected_to(conn) == Routes.approval_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.approval_path(conn, :show, approval))
      end
    end
  end

  defp create_approval(_) do
    approval = fixture(:approval)
    {:ok, approval: approval}
  end
end
