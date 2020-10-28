defmodule Janesberry.Media.Api do
  alias Janesberry.Media.{Story, Edition}

  use Ash.Api

  resources do
    resource(Story)
    resource(Story.Author)
    resource(Edition)
  end
end
