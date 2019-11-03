defmodule TimelogApp.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :approved, :boolean, default: false
    field :desc, :string
    field :name, :string
    field :time_spent, :time
    # field :worker, :user_id
    # field :manager, :user_id
    belongs_to :worker, :user
    belongs_to :manager, :user
    

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :time_spent, :approved, :worker, :manager])
    |> validate_required([:name, :desc, :time_spent, :approved, :worker, :manager])
  end
end
