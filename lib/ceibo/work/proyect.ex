defmodule Ceibo.Work.Proyect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proyects" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(proyect, attrs) do
    proyect
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
