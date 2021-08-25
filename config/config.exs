# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :crobat, CrobatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fvlpXN3sx/WCcki7juIApsugBz31OsjTTeqePuJoGqtbTbjVY2qeW1PyNw70V9gF",
  render_errors: [view: CrobatWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Crobat.PubSub,
  live_view: [signing_salt: "G3kKv9qX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
