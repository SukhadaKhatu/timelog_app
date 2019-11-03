defmodule TimelogApp.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :email, :string
      add :manager, :boolean, default: false, null: false
      add :name, :string

      timestamps()
    end

  end
end
