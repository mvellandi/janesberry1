defmodule Janesberry.Media.Story do
  alias Janesberry.{Accounts, Media}

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "stories"
    repo Janesberry.Repo
  end

  attributes do
    attribute :id, :uuid do
      primary_key?(true)
      allow_nil?(false)
      writable?(false)
      default(&Ecto.UUID.generate/0)
    end

    attribute(:title, :string, allow_nil?: false)
    attribute(:description_short, :string, allow_nil?: false)
    # attribute(:description_long, :string, allow_nil?: false)
    # attribute(:is_adaptation, :boolean, allow_nil?: false)
  end

  relationships do
    has_many :editions, Media.Edition, destination_field: :story_id
    many_to_many :authors, Accounts.Person,
      through: Media.StoryAuthor,
      # source_field: :authors,
      source_field_on_join_table: :author,
      # destination_field: :id,
      destination_field_on_join_table: :story
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
