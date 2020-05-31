defmodule CeiboWeb.ProyectLiveTest do
  use CeiboWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Ceibo.Work

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:proyect) do
    {:ok, proyect} = Work.create_proyect(@create_attrs)
    proyect
  end

  defp create_proyect(_) do
    proyect = fixture(:proyect)
    %{proyect: proyect}
  end

  describe "Index" do
    setup [:create_proyect]

    test "lists all proyects", %{conn: conn, proyect: proyect} do
      {:ok, _index_live, html} = live(conn, Routes.proyect_index_path(conn, :index))

      assert html =~ "Listing Proyects"
      assert html =~ proyect.body
    end

    test "saves new proyect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.proyect_index_path(conn, :index))

      assert index_live |> element("a", "New Proyect") |> render_click() =~
               "New Proyect"

      assert_patch(index_live, Routes.proyect_index_path(conn, :new))

      assert index_live
             |> form("#proyect-form", proyect: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#proyect-form", proyect: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.proyect_index_path(conn, :index))

      assert html =~ "Proyect created successfully"
      assert html =~ "some body"
    end

    test "updates proyect in listing", %{conn: conn, proyect: proyect} do
      {:ok, index_live, _html} = live(conn, Routes.proyect_index_path(conn, :index))

      assert index_live |> element("#proyect-#{proyect.id} a", "Edit") |> render_click() =~
               "Edit Proyect"

      assert_patch(index_live, Routes.proyect_index_path(conn, :edit, proyect))

      assert index_live
             |> form("#proyect-form", proyect: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#proyect-form", proyect: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.proyect_index_path(conn, :index))

      assert html =~ "Proyect updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes proyect in listing", %{conn: conn, proyect: proyect} do
      {:ok, index_live, _html} = live(conn, Routes.proyect_index_path(conn, :index))

      assert index_live |> element("#proyect-#{proyect.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#proyect-#{proyect.id}")
    end
  end

  describe "Show" do
    setup [:create_proyect]

    test "displays proyect", %{conn: conn, proyect: proyect} do
      {:ok, _show_live, html} = live(conn, Routes.proyect_show_path(conn, :show, proyect))

      assert html =~ "Show Proyect"
      assert html =~ proyect.body
    end

    test "updates proyect within modal", %{conn: conn, proyect: proyect} do
      {:ok, show_live, _html} = live(conn, Routes.proyect_show_path(conn, :show, proyect))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Proyect"

      assert_patch(show_live, Routes.proyect_show_path(conn, :edit, proyect))

      assert show_live
             |> form("#proyect-form", proyect: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#proyect-form", proyect: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.proyect_show_path(conn, :show, proyect))

      assert html =~ "Proyect updated successfully"
      assert html =~ "some updated body"
    end
  end
end
