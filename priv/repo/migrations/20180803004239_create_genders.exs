defmodule Db.Repo.Migrations.CreateGenders do
  use Ecto.Migration

  def change do
    create table(:genders) do
      add :is_male, :boolean, default: false, null: false
      add :is_female, :boolean, default: false, null: false

      timestamps()
    end

  end
end
