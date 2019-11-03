defmodule TimelogApp.ApprovalsTest do
  use TimelogApp.DataCase

  alias TimelogApp.Approvals

  describe "approvals" do
    alias TimelogApp.Approvals.Approval

    @valid_attrs %{approved: true, desc: "some desc", manager: 42, name: "some name", time: 42, user: 42}
    @update_attrs %{approved: false, desc: "some updated desc", manager: 43, name: "some updated name", time: 43, user: 43}
    @invalid_attrs %{approved: nil, desc: nil, manager: nil, name: nil, time: nil, user: nil}

    def approval_fixture(attrs \\ %{}) do
      {:ok, approval} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Approvals.create_approval()

      approval
    end

    test "list_approvals/0 returns all approvals" do
      approval = approval_fixture()
      assert Approvals.list_approvals() == [approval]
    end

    test "get_approval!/1 returns the approval with given id" do
      approval = approval_fixture()
      assert Approvals.get_approval!(approval.id) == approval
    end

    test "create_approval/1 with valid data creates a approval" do
      assert {:ok, %Approval{} = approval} = Approvals.create_approval(@valid_attrs)
      assert approval.approved == true
      assert approval.desc == "some desc"
      assert approval.manager == 42
      assert approval.name == "some name"
      assert approval.time == 42
      assert approval.user == 42
    end

    test "create_approval/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Approvals.create_approval(@invalid_attrs)
    end

    test "update_approval/2 with valid data updates the approval" do
      approval = approval_fixture()
      assert {:ok, %Approval{} = approval} = Approvals.update_approval(approval, @update_attrs)
      assert approval.approved == false
      assert approval.desc == "some updated desc"
      assert approval.manager == 43
      assert approval.name == "some updated name"
      assert approval.time == 43
      assert approval.user == 43
    end

    test "update_approval/2 with invalid data returns error changeset" do
      approval = approval_fixture()
      assert {:error, %Ecto.Changeset{}} = Approvals.update_approval(approval, @invalid_attrs)
      assert approval == Approvals.get_approval!(approval.id)
    end

    test "delete_approval/1 deletes the approval" do
      approval = approval_fixture()
      assert {:ok, %Approval{}} = Approvals.delete_approval(approval)
      assert_raise Ecto.NoResultsError, fn -> Approvals.get_approval!(approval.id) end
    end

    test "change_approval/1 returns a approval changeset" do
      approval = approval_fixture()
      assert %Ecto.Changeset{} = Approvals.change_approval(approval)
    end
  end
end
