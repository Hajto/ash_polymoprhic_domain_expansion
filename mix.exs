defmodule AshPolymorphicDomainExpansion.MixProject do
  use Mix.Project

  def project do
    [
      app: :ash_polymorphic_domain_expansion,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:spark, "~> 2.2.48"},
      {:ash, "~> 3.0", only: [:dev, :test]},
      {:picosat_elixir, "~> 0.2", only: [:dev, :test]},
      {:sourceror, "~> 1.7", only: [:dev, :test]},
      {:igniter, "~> 0.5", only: [:dev, :test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
