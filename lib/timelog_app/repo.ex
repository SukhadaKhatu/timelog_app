defmodule TimelogApp.Repo do
  use Ecto.Repo,
    otp_app: :timelog_app,
    adapter: Ecto.Adapters.Postgres
end
