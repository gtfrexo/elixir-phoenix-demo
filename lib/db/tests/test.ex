defmodule Db.Tests.Test do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tests" do
    field :testing, :string
    belongs_to :gender, Db.Genders.Gender

    timestamps()
  end

  @doc false
  def changeset(test, attrs) do
    test
    |> Db.Repo.preload(:gender)
    |> cast(attrs, [:testing])
    |> cast_assoc(:gender)
    |> validate_required([:testing])
  end
end
