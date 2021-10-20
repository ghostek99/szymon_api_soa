defmodule SzymonApiWeb.PageController do
  use SzymonApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
