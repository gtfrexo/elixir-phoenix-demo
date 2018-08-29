defmodule Db.Medias.Media do
  use Ecto.Schema
  import Ecto.Changeset


  schema "medias" do
    field :created_at, :utc_datetime
    field :deleted_at, :utc_datetime
    field :description, :string
    field :media_type, :string
    field :url, :string
    field :venue_id, :id
    field :event_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:created_at, :deleted_at, :description, :media_type, :url])
    |> validate_required([:created_at, :deleted_at, :description, :media_type, :url])
  end
end
