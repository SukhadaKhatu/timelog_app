defmodule TimelogApp.Repo.Migrations.CreateUserManager do
  use Ecto.Migration

  def change do
    alter table(:timelogs) do
      add :user_id, references(:users)
      add :manager_id, references(:managers)
    end
  end
end
