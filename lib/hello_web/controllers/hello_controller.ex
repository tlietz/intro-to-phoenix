# Controllers are Elixir modules, and actions are functions defined in them.
# The purpose of actions is to gather th data and perform tasks neeeded for rendering.
defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # The keys of the `params` map will always be strings.
  # If we wanted to use the entire params variable , we could do:
  #  %{"messenger" => messenger} = params
  # becausee the `=` operator is a pattern match, not an assignment
  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end
end
