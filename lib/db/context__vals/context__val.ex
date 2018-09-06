defmodule Db.Context_Vals.Context_Val do
  use Ecto.Schema
  import Ecto.Changeset


  schema "context_vals" do
    field :animal_blurb, :string
    field :boat_blurb, :string
    field :education_blurb, :string
    field :eggs_blurb, :string
    field :emoji_blurb, :string
    field :occupation_blurb, :string
    field :worst_pickup_blurb, :string

    timestamps()
  end

  @doc false
  def changeset(context__val, attrs) do
    context__val
    |> cast(attrs, [:animal_blurb, :boat_blurb, :education_blurb, :eggs_blurb, :emoji_blurb, :occupation_blurb, :worst_pickup_blurb])
    |> validate_required([:animal_blurb, :boat_blurb, :education_blurb, :eggs_blurb, :emoji_blurb, :occupation_blurb, :worst_pickup_blurb])
  end
end
