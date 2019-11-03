defmodule TimelogApp.Repo.Migrations.CreateTimesheet do
  use Ecto.Migration

  def change do
    create table(:timesheet) do
      add :name, :string
      add :desc, :string
      add :time_spent, :time

      timestamps()
    end

  end
end
