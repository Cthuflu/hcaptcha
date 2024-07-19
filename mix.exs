defmodule Hcaptcha.Mixfile do
  use Mix.Project

  @source_url "https://github.com/cthuflu/hcaptcha"
  @version "0.9.0"

  def project do
    [
      app: :hcaptcha,
      name: "hcaptcha",
      source_url: @source_url,
      version: @version,
      elixir: "~> 1.14",
      description: description(),
      deps: deps(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,

      # Test coverage:
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Dialyzer:
      dialyzer: [
        plt_add_deps: :apps_direct,
        plt_add_apps: [:jason]
      ]
    ]
  end

  def application do
    [applications: [:logger, :httpoison, :eex]]
  end

  defp description do
    """
    A simple hCaptcha package for Elixir applications, provides verification
    and templates for rendering forms with the hCaptcha widget
    """
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2", optional: true},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "0.19.3", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev]},
      {:excoveralls, "~> 0.7.1", only: :test}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Jacob Pfeiffer"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Forked From" => "https://github.com/A-World-For-Us/hcaptcha",
        "Original Recaptcha" => "https://github.com/samueljseay/recaptcha"
      }
    ]
  end
end
