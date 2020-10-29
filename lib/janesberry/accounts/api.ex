defmodule Janesberry.Accounts.Api do
  use Ash.Api

  alias Janesberry.Accounts.Person

  resources do
    resource Person
  end
end
