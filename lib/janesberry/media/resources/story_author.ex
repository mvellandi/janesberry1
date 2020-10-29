defmodule Janesberry.Media.StoryAuthor do
  alias Janesberry.Media

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "stories_authors"
    repo Janesberry.Repo
  end

  # attributes do
  #   attribute :story_id, :uuid do
  #     primary_key?(true)
  #     allow_nil?(false)
  #     writable?(false)
  #     default(&Ecto.UUID.generate/0)
  #   end
  # end

  relationships do
    belongs_to :story, Media.Story, primary_key?: true
    belongs_to :author, Media.Author, primary_key?: true
  end
end
