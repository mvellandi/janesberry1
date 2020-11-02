defmodule Janesberry.Media.Story do
  alias Janesberry.Media

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "stories"
    repo Janesberry.Repo
  end

  attributes do
    attribute :id, :uuid do
      primary_key? true
      allow_nil? false
      writable? false
      default &Ash.uuid/0
    end

    attribute :title, :string, allow_nil?: false
    attribute :description_short, :string, allow_nil?: false

    # attribute :language, type...

    # attribute :translation_of, :uuid, allow_nil?: true
    # attribute :adaptation_of, :uuid, allow_nil?: true
    # attribute(:description_long, :string, allow_nil?: false)
    # attribute(:is_adaptation, :boolean, allow_nil?: false)
  end

  relationships do
    has_many :editions, Media.Edition, destination_field: :story_id

    has_one :translation_of, Media.Story, destination_field: :id
    has_many :translations, Media.Story, destination_field: :id

    has_one :adaptation_of, Media.Story, destination_field: :id
    has_many :adaptations, Media.Story, destination_field: :id

    many_to_many :authors, Media.Author,
      through: Media.StoryAuthor,
      source_field_on_join_table: :story_id,
      destination_field_on_join_table: :author_id

    # has_many :culture_periods, Categories.CulturePeriod ...
    # has_many :genres, Categories.Genre ...
    # has_many :primary_topics, Categories.Topic ...
    # has_many :secondary_topics, Categories.Topic ...
    # has_many :affiliate_links, Link ...
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end
end
