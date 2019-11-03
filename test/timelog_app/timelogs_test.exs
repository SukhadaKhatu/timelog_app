defmodule TimelogApp.TimelogsTest do
  use TimelogApp.DataCase

  alias TimelogApp.Timelogs

  describe "timelogs" do
    alias TimelogApp.Timelogs.Timelog

    @valid_attrs %{approved: true, desc: "some desc", name: "some name", time_spent: ~T[14:00:00]}
    @update_attrs %{approved: false, desc: "some updated desc", name: "some updated name", time_spent: ~T[15:01:01]}
    @invalid_attrs %{approved: nil, desc: nil, name: nil, time_spent: nil}

    def timelog_fixture(attrs \\ %{}) do
      {:ok, timelog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timelogs.create_timelog()

      timelog
    end

    test "list_timelogs/0 returns all timelogs" do
      timelog = timelog_fixture()
      assert Timelogs.list_timelogs() == [timelog]
    end

    test "get_timelog!/1 returns the timelog with given id" do
      timelog = timelog_fixture()
      assert Timelogs.get_timelog!(timelog.id) == timelog
    end

    test "create_timelog/1 with valid data creates a timelog" do
      assert {:ok, %Timelog{} = timelog} = Timelogs.create_timelog(@valid_attrs)
      assert timelog.approved == true
      assert timelog.desc == "some desc"
      assert timelog.name == "some name"
      assert timelog.time_spent == ~T[14:00:00]
    end

    test "create_timelog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timelogs.create_timelog(@invalid_attrs)
    end

    test "update_timelog/2 with valid data updates the timelog" do
      timelog = timelog_fixture()
      assert {:ok, %Timelog{} = timelog} = Timelogs.update_timelog(timelog, @update_attrs)
      assert timelog.approved == false
      assert timelog.desc == "some updated desc"
      assert timelog.name == "some updated name"
      assert timelog.time_spent == ~T[15:01:01]
    end

    test "update_timelog/2 with invalid data returns error changeset" do
      timelog = timelog_fixture()
      assert {:error, %Ecto.Changeset{}} = Timelogs.update_timelog(timelog, @invalid_attrs)
      assert timelog == Timelogs.get_timelog!(timelog.id)
    end

    test "delete_timelog/1 deletes the timelog" do
      timelog = timelog_fixture()
      assert {:ok, %Timelog{}} = Timelogs.delete_timelog(timelog)
      assert_raise Ecto.NoResultsError, fn -> Timelogs.get_timelog!(timelog.id) end
    end

    test "change_timelog/1 returns a timelog changeset" do
      timelog = timelog_fixture()
      assert %Ecto.Changeset{} = Timelogs.change_timelog(timelog)
    end
  end
end
