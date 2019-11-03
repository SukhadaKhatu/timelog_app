defmodule TimelogApp.Repo.Migrations.CreateTimelogs do
  use Ecto.Migration

  def change do
    create table(:timelogs) do
      add :name, :string
      add :desc, :text
      add :time_spent, :time
      add :approved, :boolean, default: false, null: false

      timestamps()
    end

  end
end
