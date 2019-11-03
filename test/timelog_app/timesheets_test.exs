defmodule TimelogApp.TimesheetsTest do
  use TimelogApp.DataCase

  alias TimelogApp.Timesheets

  describe "timesheet" do
    alias TimelogApp.Timesheets.Timesheet

    @valid_attrs %{desc: "some desc", name: "some name", time_spent: ~T[14:00:00]}
    @update_attrs %{desc: "some updated desc", name: "some updated name", time_spent: ~T[15:01:01]}
    @invalid_attrs %{desc: nil, name: nil, time_spent: nil}

    def timesheet_fixture(attrs \\ %{}) do
      {:ok, timesheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timesheets.create_timesheet()

      timesheet
    end

    test "list_timesheet/0 returns all timesheet" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheet() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(@valid_attrs)
      assert timesheet.desc == "some desc"
      assert timesheet.name == "some name"
      assert timesheet.time_spent == ~T[14:00:00]
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.update_timesheet(timesheet, @update_attrs)
      assert timesheet.desc == "some updated desc"
      assert timesheet.name == "some updated name"
      assert timesheet.time_spent == ~T[15:01:01]
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end
end
