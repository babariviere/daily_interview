defmodule DailyInterview.MixProject do
  use Mix.Project

  def project do
    [
      app: :daily_interview,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_options: [warnings_as_errors: true],
      dialyzer: [
        plt_file: {:no_warn, "plts/dialyzer.plt"},
        ignore_warnings: ".dialyzer_ignore.exs"
      ],
      aliases: aliases()
    ]
  end

  defp aliases do
    [
      # current aliases...

      quality: ["format", "credo --strict", "dialyzer", "test"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false}
    ]
  end
end
