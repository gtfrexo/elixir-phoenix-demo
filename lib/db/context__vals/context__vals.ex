defmodule Db.Context_Vals do
  @moduledoc """
  The Context_Vals context.
  """

  import Ecto.Query, warn: false
  alias Db.Repo

  alias Db.Context_Vals.Context_Val

  @doc """
  Returns the list of context_vals.

  ## Examples

      iex> list_context_vals()
      [%Context_Val{}, ...]

  """
  def list_context_vals do
    Repo.all(Context_Val)
  end

  @doc """
  Gets a single context__val.

  Raises `Ecto.NoResultsError` if the Context  val does not exist.

  ## Examples

      iex> get_context__val!(123)
      %Context_Val{}

      iex> get_context__val!(456)
      ** (Ecto.NoResultsError)

  """
  def get_context__val!(id), do: Repo.get!(Context_Val, id)

  @doc """
  Creates a context__val.

  ## Examples

      iex> create_context__val(%{field: value})
      {:ok, %Context_Val{}}

      iex> create_context__val(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_context__val(attrs \\ %{}) do
    %Context_Val{}
    |> Context_Val.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a context__val.

  ## Examples

      iex> update_context__val(context__val, %{field: new_value})
      {:ok, %Context_Val{}}

      iex> update_context__val(context__val, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_context__val(%Context_Val{} = context__val, attrs) do
    context__val
    |> Context_Val.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Context_Val.

  ## Examples

      iex> delete_context__val(context__val)
      {:ok, %Context_Val{}}

      iex> delete_context__val(context__val)
      {:error, %Ecto.Changeset{}}

  """
  def delete_context__val(%Context_Val{} = context__val) do
    Repo.delete(context__val)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking context__val changes.

  ## Examples

      iex> change_context__val(context__val)
      %Ecto.Changeset{source: %Context_Val{}}

  """
  def change_context__val(%Context_Val{} = context__val) do
    Context_Val.changeset(context__val, %{})
  end
end
