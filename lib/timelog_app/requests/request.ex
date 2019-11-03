defmodule TimelogApp.Requests.Request do
  use Ecto.Schema
  import Ecto.Changeset

  schema "requests" do
    field :approved, :boolean, default: false
    field :desc, :string
    field :name, :string
    field :time, :string

    belongs_to :manager, TimelogApp.Users.User
    belongs_to :handles, TimelogApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:name, :desc, :approved, :time])
    |> validate_required([:name, :desc, :approved, :time])
  end
end
