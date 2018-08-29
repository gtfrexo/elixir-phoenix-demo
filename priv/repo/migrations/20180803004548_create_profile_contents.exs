defmodule Db.Repo.Migrations.CreateProfileContents do
  use Ecto.Migration

  def change do
    create table(:profile_contents) do
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
