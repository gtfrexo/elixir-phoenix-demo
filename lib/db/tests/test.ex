defmodule Db.Tests.Test do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tests" do
    field :testing, :string
    field :gender_id, :id

    timestamps()
  end

  @doc false
  def changeset(test, attrs) do
    test
    |> cast(attrs, [:testing, :gender_id])
    |> validate_required([:testing, :gender_id])
  end
end
