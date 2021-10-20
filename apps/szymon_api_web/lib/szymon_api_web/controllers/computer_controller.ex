defmodule SzymonApiWeb.ComputerController do
  use SzymonApiWeb, :controller

  alias SzymonApi.Computers
  alias SzymonApi.Computers.Computer

  action_fallback SzymonApiWeb.FallbackController

  def index(conn, _params) do
    computers = Computers.list_computers()
    render(conn, "index.json", computers: computers)
  end

  def create(conn, %{"computer" => computer_params}) do
    with {:ok, %Computer{} = computer} <- Computers.create_computer(computer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.computer_path(conn, :show, computer))
      |> render("show.json", computer: computer)
    end
  end

  def show(conn, %{"id" => id}) do
    computer = Computers.get_computer!(id)
    render(conn, "show.json", computer: computer)
  end

  def update(conn, %{"id" => id, "computer" => computer_params}) do
    computer = Computers.get_computer!(id)

    with {:ok, %Computer{} = computer} <- Computers.update_computer(computer, computer_params) do
      render(conn, "show.json", computer: computer)
    end
  end

  def delete(conn, %{"id" => id}) do
    computer = Computers.get_computer!(id)

    with {:ok, %Computer{}} <- Computers.delete_computer(computer) do
      send_resp(conn, :no_content, "")
    end
  end
end
