defmodule LiveviewFormWeb.HomeLive do
  use LiveviewFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form phx-submit="submit">
      <input type="number" name="length" value={@length} />
      <.button>Save</.button>
    </form>
    The length is <%= @length %>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, length: 1)
    {:ok, socket}
  end

  def handle_event("submit", %{"length" => length}, socket) do
    socket = assign(socket, length: length)
    {:noreply, socket}
  end
end
