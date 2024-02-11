defmodule LiveviewForm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveviewFormWeb.Telemetry,
      LiveviewForm.Repo,
      {DNSCluster, query: Application.get_env(:liveview_form, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveviewForm.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveviewForm.Finch},
      # Start a worker by calling: LiveviewForm.Worker.start_link(arg)
      # {LiveviewForm.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveviewFormWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewForm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewFormWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
