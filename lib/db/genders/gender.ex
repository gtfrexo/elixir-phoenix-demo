defmodule Db.Genders.Gender do
  use Ecto.Schema
  import Ecto.Changeset


  schema "genders" do
    field :is_female, :boolean, default: false
    field :is_male, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(gender, attrs) do
    gender
    |> cast(attrs, [:is_male, :is_female])
    |> validate_required([:is_male, :is_female])
  end
end
