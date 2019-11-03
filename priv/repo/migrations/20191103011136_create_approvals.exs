defmodule TimelogApp.Repo.Migrations.CreateApprovals do
  use Ecto.Migration

  def change do
    create table(:approvals) do
      add :name, :string
      add :desc, :text
      add :time, :integer
      add :approved, :boolean, default: false, null: false
      add :user, :integer
      add :manager, :integer

      timestamps()
    end

  end
end
