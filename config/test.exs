use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :f1, F1Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :f1, F1.Repo,
  username: "postgres",
  password: "postgres",
  database: "f1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
