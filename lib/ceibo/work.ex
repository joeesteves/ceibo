defmodule Ceibo.Work do
  @moduledoc """
  The Work context.
  """

  import Ecto.Query, warn: false
  alias Ceibo.Repo

  alias Ceibo.Work.Proyect

  @doc """
  Returns the list of proyects.

  ## Examples

      iex> list_proyects()
      [%Proyect{}, ...]

  """
  def list_proyects do
    Repo.all(Proyect)
  end

  @doc """
  Gets a single proyect.

  Raises `Ecto.NoResultsError` if the Proyect does not exist.

  ## Examples

      iex> get_proyect!(123)
      %Proyect{}

      iex> get_proyect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proyect!(id), do: Repo.get!(Proyect, id)

  @doc """
  Creates a proyect.

  ## Examples

      iex> create_proyect(%{field: value})
      {:ok, %Proyect{}}

      iex> create_proyect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proyect(attrs \\ %{}) do
    %Proyect{}
    |> Proyect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proyect.

  ## Examples

      iex> update_proyect(proyect, %{field: new_value})
      {:ok, %Proyect{}}

      iex> update_proyect(proyect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proyect(%Proyect{} = proyect, attrs) do
    proyect
    |> Proyect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a proyect.

  ## Examples

      iex> delete_proyect(proyect)
      {:ok, %Proyect{}}

      iex> delete_proyect(proyect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proyect(%Proyect{} = proyect) do
    Repo.delete(proyect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proyect changes.

  ## Examples

      iex> change_proyect(proyect)
      %Ecto.Changeset{data: %Proyect{}}

  """
  def change_proyect(%Proyect{} = proyect, attrs \\ %{}) do
    Proyect.changeset(proyect, attrs)
  end
end
