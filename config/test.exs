use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app, AppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

database = case System.get_env("CIRCLECI") do
  nil -> "db"
  _ -> "localhost"
end

# Configure your database
config :app, App.Repo,
  username: "postgres",
  password: "",
  database: "app_test",
  hostname: database,
  pool: Ecto.Adapters.SQL.Sandbox
