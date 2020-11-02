defmodule Janesberry.Media.StoryTest do
  use Janesberry.DataCase, async: true
  require Ash.Query
  alias Janesberry.Accounts

  describe "creating stories" do

    # setup do
    #   {:ok, author: author_fixture}
    # end

    # CREATE STORY
    # young_werther = (
    #   Media.Story
    #   |> Ash.Changeset.new(
    #     title: "The Sorrows of Young Werther",
    #     description_short: "Werther has a really bad crush that drives him crazy. Will he survive?")
    #   |> Ash.Changeset.replace_relationship(:authors, [goethe]))

    # Media.Api.create(young_werther)

    test "without existing account" do
      assert true
    end
  end

  describe "querying stories" do

    test "by name" do
      assert true
    end
  end

end
