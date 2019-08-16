defmodule Ceibo.Repo do
  use Ecto.Repo,
    otp_app: :ceibo,
    adapter: Ecto.Adapters.Postgres
end
