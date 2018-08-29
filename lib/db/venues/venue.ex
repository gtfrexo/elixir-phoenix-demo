defmodule Db.Venues.Venue do
  use Ecto.Schema
  import Ecto.Changeset


  schema "venues" do
    field :category, :string
    field :description, :string
    field :name, :string
    field :name_full, :string
    field :location_id, :id
    field :pic, :id
    has_many :events, Db.Events.Event
    has_many :hosts, Db.Hosts.Host
    has_many :images, Db.Medias.Media

    timestamps()
  end

  @doc false
  def changeset(venue, attrs) do
    venue
    |> Db.Repo.preload(:events)
    |> Db.Repo.preload(:hosts)
    |> Db.Repo.preload(:images)
    |> cast(attrs, [:category, :description, :name, :name_full])
    |> cast_assoc(:events)
    |> cast_assoc(:hosts)
    |> cast_assoc(:images)
    |> validate_required([:category, :description, :name, :name_full])
  end
end
