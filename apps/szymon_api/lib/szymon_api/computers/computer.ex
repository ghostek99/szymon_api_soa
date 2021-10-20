defmodule SzymonApi.Computers.Computer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "computers" do
    field :brand, :string
    field :colour, :string
    field :disk_size, :integer
    field :model, :string
    field :release_day, :integer
    field :release_month, :integer
    field :release_year, :integer

    timestamps()
  end

  @doc false
  def changeset(computer, attrs) do
    computer
    |> cast(attrs, [:brand, :model, :disk_size, :colour, :release_year, :release_month, :release_day])
    |> validate_required([:brand, :model, :disk_size, :colour, :release_year, :release_month, :release_day])
  end
end
