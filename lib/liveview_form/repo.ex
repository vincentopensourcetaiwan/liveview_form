defmodule LiveviewForm.Repo do
  use Ecto.Repo,
    otp_app: :liveview_form,
    adapter: Ecto.Adapters.Postgres
end
