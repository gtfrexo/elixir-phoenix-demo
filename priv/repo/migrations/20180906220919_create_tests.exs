defmodule Db.Repo.Migrations.CreateTests do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :testing, :string
      add :gender_id, references(:genders, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:tests, [:gender_id])
  end
end
