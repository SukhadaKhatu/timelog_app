defmodule TimelogApp.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :name, :string
      add :desc, :text
      add :approved, :boolean, default: false, null: false
      add :time, :string

      timestamps()
    end

  end
end
