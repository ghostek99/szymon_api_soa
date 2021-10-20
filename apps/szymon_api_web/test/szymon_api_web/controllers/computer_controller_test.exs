defmodule SzymonApiWeb.ComputerControllerTest do
  use SzymonApiWeb.ConnCase

  import SzymonApi.ComputersFixtures

  alias SzymonApi.Computers.Computer

  @create_attrs %{
    brand: "some brand",
    colour: "some colour",
    disk_size: 42,
    model: "some model",
    release_day: 42,
    release_month: 42,
    release_year: 42
  }
  @update_attrs %{
    brand: "some updated brand",
    colour: "some updated colour",
    disk_size: 43,
    model: "some updated model",
    release_day: 43,
    release_month: 43,
    release_year: 43
  }
  @invalid_attrs %{brand: nil, colour: nil, disk_size: nil, model: nil, release_day: nil, release_month: nil, release_year: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all computers", %{conn: conn} do
      conn = get(conn, Routes.computer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create computer" do
    test "renders computer when data is valid", %{conn: conn} do
      conn = post(conn, Routes.computer_path(conn, :create), computer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.computer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some brand",
               "colour" => "some colour",
               "disk_size" => 42,
               "model" => "some model",
               "release_day" => 42,
               "release_month" => 42,
               "release_year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.computer_path(conn, :create), computer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update computer" do
    setup [:create_computer]

    test "renders computer when data is valid", %{conn: conn, computer: %Computer{id: id} = computer} do
      conn = put(conn, Routes.computer_path(conn, :update, computer), computer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.computer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some updated brand",
               "colour" => "some updated colour",
               "disk_size" => 43,
               "model" => "some updated model",
               "release_day" => 43,
               "release_month" => 43,
               "release_year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, computer: computer} do
      conn = put(conn, Routes.computer_path(conn, :update, computer), computer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete computer" do
    setup [:create_computer]

    test "deletes chosen computer", %{conn: conn, computer: computer} do
      conn = delete(conn, Routes.computer_path(conn, :delete, computer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.computer_path(conn, :show, computer))
      end
    end
  end

  defp create_computer(_) do
    computer = computer_fixture()
    %{computer: computer}
  end
end
