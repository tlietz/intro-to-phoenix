# Functions defined here can be called in the respective template,
# because all templates are effectively compiled into functions inside their respective view
defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  def title() do
    "Awesome title!"
  end

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
