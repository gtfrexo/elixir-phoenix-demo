defmodule Db.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset


  schema "persons" do
    field :auth0_me_id, :string
    field :auth_token, :string
    field :bio, :string
    field :birthday, :utc_datetime
    field :email, :string
    field :email_verified, :boolean, default: false
    field :id_token, :string
    field :name, :string
    field :name_full, :string
    field :target_gender, :string
    field :target_relationship, :string
    field :token, :string
    field :gender_id, :id
    field :profile_content_id, :id
    field :profile_pic, :id
    has_many :currently_blocking, Db.Persons.Person
    has_many :blocked_by, Db.Persons.Person
    has_many :created_events, Db.Events.Event
    has_many :sent_messages, Db.Messages.Message
    has_many :received_messages, Db.Messages.Message
    has_many :chatting_with, Db.Persons.Person
    has_many :interested_pools, Db.Pools.Pool
    has_many :viewed_pools, Db.Pools.Pool
    has_many :attending_pools, Db.Pools.Pool
    has_many :images, Db.Medias.Media

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> Db.Repo.preload(:currently_blocking)
    |> Db.Repo.preload(:blocked_by)
    |> Db.Repo.preload(:created_events)
    |> Db.Repo.preload(:sent_messages)
    |> Db.Repo.preload(:received_messages)
    |> Db.Repo.preload(:chatting_with)
    |> Db.Repo.preload(:interested_pools)
    |> Db.Repo.preload(:viewed_pools)
    |> Db.Repo.preload(:attending_pools)
    |> Db.Repo.preload(:images)
    |> cast(attrs, [:auth0_me_id, :auth_token, :bio, :birthday, :email, :email_verified, :id_token, :name, :name_full, :target_gender, :target_relationship, :token])
    |> cast_assoc(:currently_blocking)
    |> cast_assoc(:blocked_by)
    |> cast_assoc(:created_events)
    |> cast_assoc(:sent_messages)
    |> cast_assoc(:received_messages)
    |> cast_assoc(:chatting_with)
    |> cast_assoc(:interested_pools)
    |> cast_assoc(:viewed_pools)
    |> cast_assoc(:attending_pools)
    |> cast_assoc(:images)
    |> validate_required([:auth0_me_id, :auth_token, :bio, :birthday, :email, :email_verified, :id_token, :name, :name_full, :target_gender, :target_relationship, :token])
  end
end
