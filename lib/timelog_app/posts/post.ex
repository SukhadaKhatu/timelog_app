defmodule TimelogApp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :approved, :boolean, default: false
    field :desc, :string
    field :name, :string

    # belongs_to :user, TimelogApp.Users.User
    # belongs_to :manager, TimelogApp.Users.User
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :desc, :approved])
    |> validate_required([:name, :desc, :approved])
  end
end
