defmodule SzymonApi.ComputersTest do
  use SzymonApi.DataCase

  alias SzymonApi.Computers

  describe "computers" do
    alias SzymonApi.Computers.Computer

    import SzymonApi.ComputersFixtures

    @invalid_attrs %{brand: nil, colour: nil, disk_size: nil, model: nil, release_day: nil, release_month: nil, release_year: nil}

    test "list_computers/0 returns all computers" do
      computer = computer_fixture()
      assert Computers.list_computers() == [computer]
    end

    test "get_computer!/1 returns the computer with given id" do
      computer = computer_fixture()
      assert Computers.get_computer!(computer.id) == computer
    end

    test "create_computer/1 with valid data creates a computer" do
      valid_attrs = %{brand: "some brand", colour: "some colour", disk_size: 42, model: "some model", release_day: 42, release_month: 42, release_year: 42}

      assert {:ok, %Computer{} = computer} = Computers.create_computer(valid_attrs)
      assert computer.brand == "some brand"
      assert computer.colour == "some colour"
      assert computer.disk_size == 42
      assert computer.model == "some model"
      assert computer.release_day == 42
      assert computer.release_month == 42
      assert computer.release_year == 42
    end

    test "create_computer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Computers.create_computer(@invalid_attrs)
    end

    test "update_computer/2 with valid data updates the computer" do
      computer = computer_fixture()
      update_attrs = %{brand: "some updated brand", colour: "some updated colour", disk_size: 43, model: "some updated model", release_day: 43, release_month: 43, release_year: 43}

      assert {:ok, %Computer{} = computer} = Computers.update_computer(computer, update_attrs)
      assert computer.brand == "some updated brand"
      assert computer.colour == "some updated colour"
      assert computer.disk_size == 43
      assert computer.model == "some updated model"
      assert computer.release_day == 43
      assert computer.release_month == 43
      assert computer.release_year == 43
    end

    test "update_computer/2 with invalid data returns error changeset" do
      computer = computer_fixture()
      assert {:error, %Ecto.Changeset{}} = Computers.update_computer(computer, @invalid_attrs)
      assert computer == Computers.get_computer!(computer.id)
    end

    test "delete_computer/1 deletes the computer" do
      computer = computer_fixture()
      assert {:ok, %Computer{}} = Computers.delete_computer(computer)
      assert_raise Ecto.NoResultsError, fn -> Computers.get_computer!(computer.id) end
    end

    test "change_computer/1 returns a computer changeset" do
      computer = computer_fixture()
      assert %Ecto.Changeset{} = Computers.change_computer(computer)
    end
  end
end
