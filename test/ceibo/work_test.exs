defmodule Ceibo.WorkTest do
  use Ceibo.DataCase

  alias Ceibo.Work

  describe "proyects" do
    alias Ceibo.Work.Proyect

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def proyect_fixture(attrs \\ %{}) do
      {:ok, proyect} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_proyect()

      proyect
    end

    test "list_proyects/0 returns all proyects" do
      proyect = proyect_fixture()
      assert Work.list_proyects() == [proyect]
    end

    test "get_proyect!/1 returns the proyect with given id" do
      proyect = proyect_fixture()
      assert Work.get_proyect!(proyect.id) == proyect
    end

    test "create_proyect/1 with valid data creates a proyect" do
      assert {:ok, %Proyect{} = proyect} = Work.create_proyect(@valid_attrs)
      assert proyect.body == "some body"
      assert proyect.title == "some title"
    end

    test "create_proyect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_proyect(@invalid_attrs)
    end

    test "update_proyect/2 with valid data updates the proyect" do
      proyect = proyect_fixture()
      assert {:ok, %Proyect{} = proyect} = Work.update_proyect(proyect, @update_attrs)
      assert proyect.body == "some updated body"
      assert proyect.title == "some updated title"
    end

    test "update_proyect/2 with invalid data returns error changeset" do
      proyect = proyect_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_proyect(proyect, @invalid_attrs)
      assert proyect == Work.get_proyect!(proyect.id)
    end

    test "delete_proyect/1 deletes the proyect" do
      proyect = proyect_fixture()
      assert {:ok, %Proyect{}} = Work.delete_proyect(proyect)
      assert_raise Ecto.NoResultsError, fn -> Work.get_proyect!(proyect.id) end
    end

    test "change_proyect/1 returns a proyect changeset" do
      proyect = proyect_fixture()
      assert %Ecto.Changeset{} = Work.change_proyect(proyect)
    end
  end
end
