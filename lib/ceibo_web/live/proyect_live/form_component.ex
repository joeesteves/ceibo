defmodule CeiboWeb.ProyectLive.FormComponent do
  use CeiboWeb, :live_component

  alias Ceibo.Work

  @impl true
  def update(%{proyect: proyect} = assigns, socket) do
    changeset = Work.change_proyect(proyect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"proyect" => proyect_params}, socket) do
    changeset =
      socket.assigns.proyect
      |> Work.change_proyect(proyect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"proyect" => proyect_params}, socket) do
    save_proyect(socket, socket.assigns.action, proyect_params)
  end

  defp save_proyect(socket, :edit, proyect_params) do
    case Work.update_proyect(socket.assigns.proyect, proyect_params) do
      {:ok, _proyect} ->
        {:noreply,
         socket
         |> put_flash(:info, "Proyect updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_proyect(socket, :new, proyect_params) do
    case Work.create_proyect(proyect_params) do
      {:ok, _proyect} ->
        {:noreply,
         socket
         |> put_flash(:info, "Proyect created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
