defmodule LiveviewFormWeb.HomeLive do
  use LiveviewFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form phx-submit="submit">
      <input type="number" name="length" value="1" />
      <.button>Save</.button>
    </form>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("submit", %{"length" => length}, socket) do
    IO.inspect(length)
    {:noreply, socket}
  end
end
