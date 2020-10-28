defmodule Janesberry.Accounts.Person do
  alias Janesberry.Media

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "persons"
    repo Janesberry.Repo
  end

  attributes do

    attribute :id, :uuid do
      primary_key?(true)
      allow_nil?(false)
      writable?(false)
      default(&Ecto.UUID.generate/0)
    end

    attribute(:first_name, :string, allow_nil?: false)
    attribute(:last_name, :string, allow_nil?: false)
    attribute(:alt_name, :string, allow_nil?: true)

    # dead artists don't have emails
    attribute :email, :string, allow_nil?: true, constraints: [
        match: ~r/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/
    ]

    # attribute(:description_short, :string, allow_nil?: false)
    # attribute(:description_long, :string, allow_nil?: false)
    # attribute(:birth_year, :integer, allow_nil?: false)
    # attribute(:death_year, :integer, allow_nil?: false, default(3000))
  end

  relationships do
      many_to_many :stories, Media.Story,
        through: Media.StoryAuthor,
        # source_field: :text,
        source_field_on_join_table: :story,
        # destination_field: :id,
        destination_field_on_join_table: :author
    # has_many :stories, Media.Story, destination_field: :authors
    # has_many :genres, Media.Story, destination_field: :author_id
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end

end
