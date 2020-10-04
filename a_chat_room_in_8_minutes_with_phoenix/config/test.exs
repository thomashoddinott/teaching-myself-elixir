use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :a_chat_room_in_8_minutes_with_phoenix, AChatRoomIn8MinutesWithPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  database: "a_chat_room_in_8_minutes_with_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :a_chat_room_in_8_minutes_with_phoenix, AChatRoomIn8MinutesWithPhoenixWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
