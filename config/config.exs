# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix_slime, :use_slim_extension, true

# General application configuration
config :ipapy_web,
  ecto_repos: [IpapyWeb.Repo]

config :ipapy_web, IpapyWeb.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: "nicolas.vandenbogaerde@gmail.com",
  password: "nic0lasva",
  ssl: true,
  retries: 1


# Configures the endpoint
config :ipapy_web, IpapyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+ev1BtBZpceCMhy11aISTHnoEcf7OA7EB/UPbIlktglLafdCdZN5Sr0HE9Ap1mSG",
  render_errors: [view: IpapyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IpapyWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
