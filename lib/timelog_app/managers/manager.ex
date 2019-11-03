defmodule TimelogApp.Managers.Manager do
  use Ecto.Schema
  import Ecto.Changeset

  schema "managers" do
    field :email, :string
    field :manager, :boolean, default: false
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(manager, attrs) do
    manager
    |> cast(attrs, [:email, :name, :password, :password_confirmation, :manager])
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8) # too short
    |> hash_password()
    |> validate_required([:email, :name, :password_hash])
  end
  #   |> cast(attrs, [:email, :manager, :name])
  #   |> validate_required([:email, :manager, :name])
  # end
  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end

end
