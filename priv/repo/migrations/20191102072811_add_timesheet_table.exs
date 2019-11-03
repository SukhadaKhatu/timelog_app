defmodule TimelogApp.Repo.Migrations.AddTimesheetTable do
  use Ecto.Migration

  def change do
    alter table(:timesheet) do
      add :approved, :boolean
      add :worker, references(:users)
      add :manager, references(:users)
    end
  end
end
