defmodule Ip.Application do
  @moduledoc """
  Documentation for `Ip.Application`.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: Ip.Routers, otp_app: :ip}
    ]

    opts = [strategy: :one_for_one, name: Ip.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
