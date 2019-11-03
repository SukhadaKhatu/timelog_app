use Mix.Config

# Configure your database
config :timelog_app, TimelogApp.Repo,
  username: "timelog_app",
  password: "ohch4WuChe3A",
  database: "timelog_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timelog_app, TimelogAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
