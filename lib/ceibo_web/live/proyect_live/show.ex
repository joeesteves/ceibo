defmodule CeiboWeb.ProyectLive.Show do
  use CeiboWeb, :live_view

  alias Ceibo.Work

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:proyect, Work.get_proyect!(id))}
  end

  defp page_title(:show), do: "Show Proyect"
  defp page_title(:edit), do: "Edit Proyect"
end
