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
#
alias Janesberry.Accounts
alias Janesberry.Accounts.Person
alias Janesberry.Media
alias Janesberry.Media.{Author, Story, Edition}

# CREATE AUTHOR
goethe = Ash.Changeset.new(
  Person,
  [first_name: "Johann Wolfgang", last_name: "von Goethe", alt_name: "Goethe"])

{:ok, goethe} = Accounts.Api.create(goethe)

# QUERY FOR AUTHOR
name_query = Ash.Query.filter(alt_name: "Goethe")
{:ok, results} = Ash.Api.get(Person, name_query, [])
goethe = hd(results)

# CREATE STORY
young_werther = Ash.Changeset.new(
  Story, [
    title: "The Sorrows of Young Werther",
    authors: [goethe.id],
    description_short: "Werther has a really bad crush that drives him crazy. Will he survive?"
  ])

Media.Api.create(young_werther)
