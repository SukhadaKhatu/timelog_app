defmodule TimelogApp.Repo.Migrations.AddPasswordHashManager do
  use Ecto.Migration

  def change do
    alter table("managers") do
      add :password_hash, :string, default: "", null: false
    end
  end
end
