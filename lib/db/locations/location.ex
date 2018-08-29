defmodule Db.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :address, :string
    field :address_full, :string
    field :city, :string
    field :country, :string
    field :lat, :float
    field :lon, :float
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:address, :address_full, :city, :country, :lat, :lon, :state, :zip])
    |> validate_required([:address, :address_full, :city, :country, :lat, :lon, :state, :zip])
  end
end
