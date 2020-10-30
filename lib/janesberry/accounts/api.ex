defmodule Janesberry.Accounts.Api do
  alias Janesberry.Accounts.Person

  use Ash.Api

  resources do
    resource Person
  end
end
