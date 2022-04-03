# Controllers are Elixir modules, and actions are functions defined in them.
# The purpose of actions is to gather the data and perform tasks needed before invoking the view layer to render a template or returning a JSON response.
defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "kr" when action in [:index, :show]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # The keys of the `params` map will always be strings.
  # If we wanted to use the entire params variable , we could do:
  #  %{"messenger" => messenger} = params
  # becausee the `=` operator is a pattern match, not an assignment
  def show(conn, %{"messenger" => messenger}) do
    # In order for the `render/3` function to work correctly,
    # the controller and view must share the same root name (in this case `Hello`),
    # and it also must have the same root name as the template directory (in this case `hello`)
    # where the `show.html.heex` template is.
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render("show.html")
  end
end
