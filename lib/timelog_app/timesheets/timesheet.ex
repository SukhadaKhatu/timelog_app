defmodule TimelogApp.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheet" do
    field :desc, :string
    field :name, :string
    field :time_spent, :time
    field :approved, :boolean, default: false
    belongs_to :worker, TimelogApp.Users.User
    belongs_to :manager, TimelogApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:name, :desc, :time_spent, :approved])
    |> validate_required([:name, :desc, :time_spent, :approved])
  end
  
end
