defmodule Db.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :category, :string
      add :created_at, :utc_datetime
      add :description, :string
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :title, :string
      add :title_full, :string

      timestamps()
    end

  end
end
