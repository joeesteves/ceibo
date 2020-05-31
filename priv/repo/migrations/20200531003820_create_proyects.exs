defmodule Ceibo.Repo.Migrations.CreateProyects do
  use Ecto.Migration

  def change do
    create table(:proyects) do
      add :title, :string
      add :body, :string

      timestamps()
    end

  end
end
