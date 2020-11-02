# defmodule Janesberry.TestHelpers do
#   alias Janesberry.Accounts

#   def author_fixture(attrs \\ %{}) do
#     {:ok, author} =
#       attrs
#       |> Enum.into(%{
#         first_name: "Johann Wolfgang",
#         last_name: "von Göthe",
#         alt_name: "Goethe"
#       })
#       Ash.Changeset.new(Accounts.Person, @goethe)
#       |> Accounts.register_user()

#     author
#   end
# end
