defmodule SvgServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :svg_server,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {SvgServer.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.5"}
    ]
  end
end