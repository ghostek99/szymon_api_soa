defmodule SzymonApi.ComputersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SzymonApi.Computers` context.
  """

  @doc """
  Generate a computer.
  """
  def computer_fixture(attrs \\ %{}) do
    {:ok, computer} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        colour: "some colour",
        disk_size: 42,
        model: "some model",
        release_day: 42,
        release_month: 42,
        release_year: 42
      })
      |> SzymonApi.Computers.create_computer()

    computer
  end
end
