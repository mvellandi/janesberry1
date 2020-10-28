defmodule Janesberry.Media.Api do
  alias Janesberry.Media.{Story, Edition}

  use Ash.Api

  resources do
    resource(Story)
    resource(Edition)
  end
end
