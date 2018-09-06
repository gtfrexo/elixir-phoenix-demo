defmodule DbWeb.UserSocket do
  use Phoenix.Socket

  ## Channels

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket,
    timeout: 45_000
  
  def connect(_params, socket) do
    {:ok, socket}
  end

  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
