defmodule SzymonApiWeb.ComputerView do
  use SzymonApiWeb, :view
  alias SzymonApiWeb.ComputerView

  def render("index.json", %{computers: computers}) do
    %{data: render_many(computers, ComputerView, "computer.json")}
  end

  def render("show.json", %{computer: computer}) do
    %{data: render_one(computer, ComputerView, "computer.json")}
  end

  def render("computer.json", %{computer: computer}) do
    %{
      id: computer.id,
      brand: computer.brand,
      model: computer.model,
      disk_size: computer.disk_size,
      colour: computer.colour,
      release_year: computer.release_year,
      release_month: computer.release_month,
      release_day: computer.release_day,
      price: computer.price
    }
  end
end
