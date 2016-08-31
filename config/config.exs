# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_demo,
  ecto_repos: [PhoenixDemo.Repo]

# Configures the endpoint
config :phoenix_demo, PhoenixDemo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I1f1ljPz58+BjRNvlOrf7Pt5vmMb8QV/u5QS5I9SEjxIGy8NUiaC1c+FqYK/AsLH",
  render_errors: [view: PhoenixDemo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    google: { Ueberauth.Strategy.Google, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_APP_ID"),
  client_secret: System.get_env("GOOGLE_APP_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
