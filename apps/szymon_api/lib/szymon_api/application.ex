defmodule SzymonApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SzymonApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SzymonApi.PubSub}
      # Start a worker by calling: SzymonApi.Worker.start_link(arg)
      # {SzymonApi.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SzymonApi.Supervisor)
  end
end
