# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Janesberry.Repo.insert!(%Janesberry.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Reset
# mix ecto.drop && mix ecto.create
# delete migrations and resource_snapshots
# mix ash_postgres.generate_migrations --apis Janesberry.Accounts.Api
# mix ash_postgres.generate_migrations --apis Janesberry.Media.Api
# delete extra primary key declarations in join tables
# mix ecto.migrate
#


