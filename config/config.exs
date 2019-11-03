# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :timelog_app,
  ecto_repos: [TimelogApp.Repo]

# Configures the endpoint
config :timelog_app, TimelogAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UaVf1JQo1O92pRFdSvdnGmjrWLqW8/Ov2sN8ujZwqKm93WPNOs+4+XAXp6VPYtVN",
  render_errors: [view: TimelogAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TimelogApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
