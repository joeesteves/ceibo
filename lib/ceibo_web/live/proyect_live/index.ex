defmodule CeiboWeb.ProyectLive.Index do
  use CeiboWeb, :live_view

  alias Ceibo.Work
  alias Ceibo.Work.Proyect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :proyects, list_proyects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Proyect")
    |> assign(:proyect, Work.get_proyect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Proyect")
    |> assign(:proyect, %Proyect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Proyects")
    |> assign(:proyect, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    proyect = Work.get_proyect!(id)
    {:ok, _} = Work.delete_proyect(proyect)

    {:noreply, assign(socket, :proyects, list_proyects())}
  end

  defp list_proyects do
    Work.list_proyects()
  end
end
