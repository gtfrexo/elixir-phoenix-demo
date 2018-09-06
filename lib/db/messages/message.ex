defmodule Db.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    field :read_at, :utc_datetime
    field :sent_at, :utc_datetime
    field :from_person, :id
    field :to_person, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :read_at, :sent_at])
    |> validate_required([:content, :read_at, :sent_at])
  end
end
