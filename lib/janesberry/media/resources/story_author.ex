defmodule Janesberry.Media.StoryAuthor do
  alias Janesberry.Media.{Story, Author}

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "stories_authors"
    repo Janesberry.Repo
  end

  relationships do
    belongs_to :story, Story, primary_key?: true
    belongs_to :author, Author, primary_key?: true
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end

end
