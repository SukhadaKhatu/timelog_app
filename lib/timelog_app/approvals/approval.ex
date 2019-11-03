defmodule TimelogApp.Approvals.Approval do
  use Ecto.Schema
  import Ecto.Changeset

  schema "approvals" do
    field :approved, :boolean, default: false
    field :desc, :string
    field :manager, :integer
    field :name, :string
    field :time, :integer
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(approval, attrs) do
    approval
    |> cast(attrs, [:name, :desc, :time, :approved, :user, :manager])
    |> validate_required([:name, :desc, :time, :approved, :user, :manager])
  end
end
