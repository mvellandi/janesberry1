defmodule Janesberry.Repo do
  use Ecto.Repo,
    otp_app: :janesberry,
    adapter: Ecto.Adapters.Postgres
end
