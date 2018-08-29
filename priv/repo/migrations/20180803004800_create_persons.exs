defmodule Db.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :auth0_me_id, :string
      add :auth_token, :string
      add :bio, :string
      add :birthday, :utc_datetime
      add :email, :string
      add :email_verified, :boolean, default: false, null: false
      add :id_token, :string
      add :name, :string
      add :name_full, :string
      add :target_gender, :string
      add :target_relationship, :string
      add :token, :string

      timestamps()
    end

  end
end
