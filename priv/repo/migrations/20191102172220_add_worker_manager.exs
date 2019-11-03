defmodule TimelogApp.Repo.Migrations.AddWorkerManager do
  use Ecto.Migration

  def change do
    alter table(:timelogs) do
      add :user, references(:users)
      add :manager, references(:managers)
    end
  end
end
