# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rockelivery, Rockelivery.Users.Create, via_cep_adapter: Rockelivery.ViaCep.Client

config :rockelivery,
  ecto_repos: [Rockelivery.Repo]

config :rockelivery, Rockelivery.Repo,
  # configuração para gerar uuid nessas chaves
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :rockelivery, RockeliveryWeb.Auth.Pipeline,
  module: RockeliveryWeb.Auth.Guardian,
  error_handler: RockeliveryWeb.Auth.ErrorHandler

config :rockelivery, RockeliveryWeb.Auth.Guardian,
  issuer: "rockelivery",
  secret_key: "oFREaOo1hroHOPeyj9si6MR7HmSxCmbxWDi5tpOTk0be4bZ4bNXNyu+Hy4rHgyiv"

# Configures the endpoint
config :rockelivery, RockeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "otD1V9AjBn8WO+9iBxYSiyfbLvUUwqSFJvoJOoAKx/3qsLHFzAZ/6KY3IKDobgvz",
  render_errors: [view: RockeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rockelivery.PubSub,
  live_view: [signing_salt: "WYL8ejOv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
