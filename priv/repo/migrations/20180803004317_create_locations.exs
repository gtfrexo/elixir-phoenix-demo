defmodule Db.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string
      add :address_full, :string
      add :city, :string
      add :country, :string
      add :lat, :float
      add :lon, :float
      add :state, :string
      add :zip, :string

      timestamps()
    end

  end
end
