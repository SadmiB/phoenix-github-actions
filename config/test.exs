use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hello_world, HelloWorld.Repo,
  username: "test_user",
  password: "TestUser123",
  database: "test_db#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_world, HelloWorldWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

if System.get_env("GITHUB_ACTIONS") do
 config :my_app, MyApp.Repo,
   username: "test_user",
   password: "TestUser123"
end
