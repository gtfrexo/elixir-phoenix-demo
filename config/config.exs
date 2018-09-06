use Mix.Config

# General application configuration
config :db,
  ecto_repos: [Db.Repo]

# Configures the endpoint
config :db, DbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FaRzDjx8olcbZStavjTvKMoF4Y8OT+qzy3ksths8U+GKdW62bdKTL/RvqA9xKsoC",
  render_errors: [view: DbWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Db.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :cors_plug,
  origin: ["*"],
  max_age: 86400,
  methods: ["GET", "POST"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
