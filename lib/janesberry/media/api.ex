defmodule Janesberry.Media.Api do
  alias Janesberry.Media.{Story, StoryAuthor, Author, Edition}

  use Ash.Api

  resources do
    resource Author
    resource Story
    resource StoryAuthor
    resource Edition
  end
end
