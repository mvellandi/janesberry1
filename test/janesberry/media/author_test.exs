defmodule Janesberry.Media.AuthorTest do
  use Janesberry.DataCase, async: true
  require Ash.Query
  alias Janesberry.Accounts

  describe "creating authors" do
    # @goethe %{first_name: "Johann Wolfgang", last_name: "von Göthe", alt_name: "Goethe"}
    @goethe [first_name: "Johann Wolfgang", last_name: "von Göthe", alt_name: "Goethe"]

    # setup do
    #   {:ok, author: author_fixture}
    # end

    test "without existing account" do
      goethe = Ash.Changeset.new(Accounts.Person, @goethe)
      assert goethe.valid? == true
      assert {:ok, goethe} = Accounts.Api.create(goethe)
    end
  end

  describe "querying authors" do
    @goethe [first_name: "Johann Wolfgang", last_name: "von Göthe", alt_name: "Goethe"]

    test "by name" do
      Ash.Changeset.new(Accounts.Person, @goethe) |> Accounts.Api.create()
      name_query = Ash.Query.filter(Accounts.Person, alt_name: "Goethe")
      assert {:ok, results} = Accounts.Api.read(name_query)
      assert hd(results).alt_name == "Goethe"
    end
  end

end
