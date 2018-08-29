defmodule Db.Repo.Migrations.CreatePools do
  use Ecto.Migration

  def change do
    create table(:pools) do
      add :eventbrite_id, :string
      add :seatgeek_id, :string

      timestamps()
    end

  end
end
