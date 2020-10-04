defmodule AChatRoomIn8MinutesWithPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AChatRoomIn8MinutesWithPhoenix.Repo,
      # Start the Telemetry supervisor
      AChatRoomIn8MinutesWithPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AChatRoomIn8MinutesWithPhoenix.PubSub},
      # Start the Endpoint (http/https)
      AChatRoomIn8MinutesWithPhoenixWeb.Endpoint
      # Start a worker by calling: AChatRoomIn8MinutesWithPhoenix.Worker.start_link(arg)
      # {AChatRoomIn8MinutesWithPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AChatRoomIn8MinutesWithPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AChatRoomIn8MinutesWithPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
