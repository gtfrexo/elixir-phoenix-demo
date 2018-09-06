defmodule Db.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :category, :string
    field :created_at, :utc_datetime
    field :description, :string
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    field :title, :string
    field :title_full, :string
    field :created_by, :id
    field :location_id, :id
    field :pic, :id
    field :pool_id, :id
    field :host_id, :id
    has_many :images, Db.Medias.Media
    has_many :venues, Db.Venues.Venue

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> Db.Repo.preload(:images)
    |> Db.Repo.preload(:venues)
    |> cast(attrs, [:category, :created_at, :description, :start_time, :end_time, :title, :title_full])
    |> cast_assoc(:images)
    |> cast_assoc(:venues)
    |> validate_required([:category, :created_at, :description, :start_time, :end_time, :title, :title_full])
  end
end
