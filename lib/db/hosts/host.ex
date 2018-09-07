defmodule Db.Hosts.Host do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hosts" do
    field :description, :string
    field :name, :string
    field :name_full, :string
    field :venue_id, :id
    timestamps()
  end

  @doc false
  def changeset(host, attrs) do
    host
    |> cast(attrs, [:description, :name, :name_full, :venue_id])
    |> validate_required([:description, :name, :name_full, :venue_id])
  end
end
