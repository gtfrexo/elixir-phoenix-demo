defmodule Db.Repo.Migrations.CreateContextVals do
  use Ecto.Migration

  def change do
    create table(:context_vals) do
      add :animal_blurb, :string
      add :boat_blurb, :string
      add :education_blurb, :string
      add :eggs_blurb, :string
      add :emoji_blurb, :string
      add :occupation_blurb, :string
      add :worst_pickup_blurb, :string

      timestamps()
    end

  end
end
