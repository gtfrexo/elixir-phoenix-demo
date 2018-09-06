defmodule Db.Profile_Contents do
  @moduledoc """
  The Profile_Contents context.
  """

  import Ecto.Query, warn: false
  alias Db.Repo

  alias Db.Profile_Contents.Profile_Content

  @doc """
  Returns the list of profile_contents.

  ## Examples

      iex> list_profile_contents()
      [%Profile_Content{}, ...]

  """
  def list_profile_contents do
    Repo.all(Profile_Content)
  end

  @doc """
  Gets a single profile__content.

  Raises `Ecto.NoResultsError` if the Profile  content does not exist.

  ## Examples

      iex> get_profile__content!(123)
      %Profile_Content{}

      iex> get_profile__content!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile__content!(id), do: Repo.get!(Profile_Content, id)

  @doc """
  Creates a profile__content.

  ## Examples

      iex> create_profile__content(%{field: value})
      {:ok, %Profile_Content{}}

      iex> create_profile__content(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile__content(attrs \\ %{}) do
    %Profile_Content{}
    |> Profile_Content.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile__content.

  ## Examples

      iex> update_profile__content(profile__content, %{field: new_value})
      {:ok, %Profile_Content{}}

      iex> update_profile__content(profile__content, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile__content(%Profile_Content{} = profile__content, attrs) do
    profile__content
    |> Profile_Content.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Profile_Content.

  ## Examples

      iex> delete_profile__content(profile__content)
      {:ok, %Profile_Content{}}

      iex> delete_profile__content(profile__content)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile__content(%Profile_Content{} = profile__content) do
    Repo.delete(profile__content)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile__content changes.

  ## Examples

      iex> change_profile__content(profile__content)
      %Ecto.Changeset{source: %Profile_Content{}}

  """
  def change_profile__content(%Profile_Content{} = profile__content) do
    Profile_Content.changeset(profile__content, %{})
  end
end
