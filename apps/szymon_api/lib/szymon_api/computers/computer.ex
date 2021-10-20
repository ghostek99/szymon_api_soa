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
    field :price, :float

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(computer, attrs) do
    computer
    |> cast(attrs, [:brand, :model, :disk_size, :colour, :release_year, :release_month, :release_day, :price])
    |> validate_required([:brand, :model, :disk_size, :colour, :release_year, :release_month, :release_day, :price])
  end
end
