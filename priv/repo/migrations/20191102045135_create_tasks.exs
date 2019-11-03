defmodule TimelogApp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :desc, :text
      add :time_spent, :time
      add :approved, :boolean, default: false, null: false
      add :worker, references(:users, on_delete: :nothing)
      add :manager, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:worker])
    create index(:tasks, [:manager])
  end
end
