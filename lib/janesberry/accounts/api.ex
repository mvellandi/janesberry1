defmodule Janesberry.Accounts.Api do
  alias Janesberry.Accounts.Person
  alias Janesberry.Media
  use Ash.Api

  resources do
    resource(Person)
    resource(Media.Story)
    resource(Media.StoryAuthor)
    resource(Media.Edition)
  end
end
