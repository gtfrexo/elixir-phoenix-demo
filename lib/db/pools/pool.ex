defmodule Db.Pools.Pool do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pools" do
    field :eventbrite_id, :string
    field :seatgeek_id, :string
    field :event_id, :id
    has_many :interested_persons, Db.Persons.Person
    has_many :attending_persons, Db.Persons.Person
    has_many :viewed_persons, Db.Persons.Person

    timestamps()
  end

  @doc false
  def changeset(pool, attrs) do
    pool
    |> Db.Repo.preload(:interested_persons)
    |> Db.Repo.preload(:attending_persons)
    |> Db.Repo.preload(:viewed_persons)
    |> cast(attrs, [:eventbrite_id, :seatgeek_id])
    |> cast_assoc(:interested_persons)
    |> cast_assoc(:attending_persons)
    |> cast_assoc(:viewed_persons)
    |> validate_required([:eventbrite_id, :seatgeek_id])
  end
end
