defmodule Db.Versions.Version do
  use Ecto.Schema
  import Ecto.Changeset


  schema "versions" do
    field :current_version, :string
    field :target_version, :string

    timestamps()
  end

  @doc false
  def changeset(version, attrs) do
    version
    |> cast(attrs, [:current_version, :target_version])
    |> validate_required([:current_version, :target_version])
  end
end
