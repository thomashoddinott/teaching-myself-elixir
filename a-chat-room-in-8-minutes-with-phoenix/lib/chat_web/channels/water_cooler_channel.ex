defmodule ChatWeb.WaterCoolerChannel do
  use ChatWeb, :channel

  alias Chat.Chats

  @impl true
  def join("water_cooler:lobby", _payload, socket) do
      {:ok, socket}
  end

  # # Channels can be used in a request/response fashion
  # # by sending replies to requests from the client
  # @impl true
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (water_cooler:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
