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
    |> cast(attrs, [:testing, :gender_id])
    |> validate_required([:testing])
  end
end
