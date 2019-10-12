defmodule Minify.Repo do
  use Ecto.Repo,
    otp_app: :minify,
    adapter: Ecto.Adapters.Postgres
end
