defmodule Janesberry.Media.Edition do
  alias Janesberry.Media

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "editions"
    repo Janesberry.Repo
  end

  attributes do
    attribute :id, :uuid do
      primary_key? true
      allow_nil? false
      writable? false
      default &Ecto.UUID.generate/0
    end

    attribute :body, :string, allow_nil?: false
  end

  relationships do
    belongs_to :parent_story, Media.Story, source_field: :story_id
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end
end
