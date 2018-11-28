# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :f1,
  ecto_repos: [F1.Repo]

# Configures the endpoint
config :f1, F1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "299pwZ7p2uV3BxqDVgeH172OPYcaRHZjb/4XnpiWzmIA9NHY+qRPfgVY70ncwbde",
  render_errors: [view: F1Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: F1.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
