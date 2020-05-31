defmodule CeiboWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `CeiboWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, CeiboWeb.ProyectLive.FormComponent,
        id: @proyect.id || :new,
        action: @live_action,
        proyect: @proyect,
        return_to: Routes.proyect_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, CeiboWeb.ModalComponent, modal_opts)
  end
end
