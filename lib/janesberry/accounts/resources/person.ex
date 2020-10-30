defmodule Janesberry.Accounts.Person do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "persons"
    repo Janesberry.Repo
  end

  attributes do
    attribute :id, :uuid do
      primary_key? true
      allow_nil? false
      writable? false
      default &Ash.uuid/0
    end

    attribute :first_name, :string, allow_nil?: false
    attribute :last_name, :string, allow_nil?: false
    attribute :alt_name, :string, allow_nil?: true

    # dead artists don't have emails
    attribute :email, :string,
      allow_nil?: true,
      constraints: [
        match: ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i
      ]

    # attribute(:description_short, :string, allow_nil?: false)
    # attribute(:description_long, :string, allow_nil?: false)
    # attribute(:birth_year, :integer, allow_nil?: false)
    # attribute(:death_year, :integer, allow_nil?: false, default(3000))
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end
end
