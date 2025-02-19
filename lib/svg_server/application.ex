defmodule SvgServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: SvgServer.Router, options: [port: 3000]}
    ]

    opts = [strategy: :one_for_one, name: SvgServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end