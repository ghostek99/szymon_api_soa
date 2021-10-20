# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SzymonApi.Repo.insert!(%SzymonApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, _cs} =
  SzymonApi.Computers.create_computer(%{"brand" => "Intel", "colour" => "Black", "disk_size" => 1000, "model" => "AC3", "release_day" => 15, "release_month" => 08, "release_year" => 2019, "price" => 1000.00})
{:ok, _cs} =
  SzymonApi.Computers.create_computer(%{"brand" => "Acer", "colour" => "Gray", "disk_size" => 1500, "model" => "IP2", "release_day" => 10, "release_month" => 12, "release_year" => 2018, "price" => 1500.00})
{:ok, _cs} =
  SzymonApi.Computers.create_computer(%{"brand" => "Apple", "colour" => "White", "disk_size" => 500, "model" => "Mac", "release_day" => 20, "release_month" => 05, "release_year" => 2017, "price" => 5100.00})
