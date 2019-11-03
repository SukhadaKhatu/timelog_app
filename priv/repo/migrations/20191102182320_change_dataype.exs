defmodule TimelogApp.Repo.Migrations.ChangeDataype do
  use Ecto.Migration

  def change do
    alter table(:timelogs) do
      remove :time_spent
    end
  end
end
