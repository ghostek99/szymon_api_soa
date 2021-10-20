defmodule SzymonApi.Repo do
  use Ecto.Repo,
    otp_app: :szymon_api,
    adapter: Ecto.Adapters.Postgres
end
