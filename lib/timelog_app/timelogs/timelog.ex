defmodule TimelogApp.Timelogs.Timelog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timelogs" do
    field :approved, :boolean, default: false
    field :desc, :string
    field :name, :string
    # field :time_spent, :time
    belongs_to :user, TimelogApp.Users.User
    belongs_to :manager, TimelogApp.Managers.Manager
    # belongs_to :handles, TimelogApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(timelog, attrs) do
    timelog
    |> cast(attrs, [:name, :desc, :approved])
    |> validate_required([:name, :desc, :approved])
  end
end
