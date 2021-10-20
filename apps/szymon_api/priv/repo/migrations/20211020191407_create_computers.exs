defmodule SzymonApi.Repo.Migrations.CreateComputers do
  use Ecto.Migration

  def change do
    create table(:computers) do
      add :brand, :string
      add :model, :string
      add :disk_size, :integer
      add :colour, :string
      add :release_year, :integer
      add :release_month, :integer
      add :release_day, :integer
      add :price, :float

      timestamps()
    end
  end
end
