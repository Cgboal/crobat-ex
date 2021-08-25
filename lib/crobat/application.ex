defmodule Crobat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      #CrobatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Crobat.PubSub},
      # Start the Endpoint (http/https)
      CrobatWeb.Endpoint,
      {Mongo, [name: :mongo, database: "sonar", pool_size: 256]}
      # Start a worker by calling: Crobat.Worker.start_link(arg)
      # {Crobat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crobat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrobatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
