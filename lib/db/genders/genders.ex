defmodule Db.Genders do
  @moduledoc """
  The Genders context.
  """

  import Ecto.Query, warn: false
  alias Db.Repo

  alias Db.Genders.Gender

  @doc """
  Returns the list of genders.

  ## Examples

      iex> list_genders()
      [%Gender{}, ...]

  """
  def list_genders do
    Repo.all(Gender)
  end

  @doc """
  Gets a single gender.

  Raises `Ecto.NoResultsError` if the Gender does not exist.

  ## Examples

      iex> get_gender!(123)
      %Gender{}

      iex> get_gender!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gender!(id), do: Repo.get!(Gender, id)

  @doc """
  Creates a gender.

  ## Examples

      iex> create_gender(%{field: value})
      {:ok, %Gender{}}

      iex> create_gender(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gender(attrs \\ %{}) do
    %Gender{}
    |> Gender.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gender.

  ## Examples

      iex> update_gender(gender, %{field: new_value})
      {:ok, %Gender{}}

      iex> update_gender(gender, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gender(%Gender{} = gender, attrs) do
    gender
    |> Gender.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gender.

  ## Examples

      iex> delete_gender(gender)
      {:ok, %Gender{}}

      iex> delete_gender(gender)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gender(%Gender{} = gender) do
    Repo.delete(gender)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gender changes.

  ## Examples

      iex> change_gender(gender)
      %Ecto.Changeset{source: %Gender{}}

  """
  def change_gender(%Gender{} = gender) do
    Gender.changeset(gender, %{})
  end
end
