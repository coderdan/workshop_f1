# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     F1.Repo.insert!(%F1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

drivers =
  [
    {"L.Hamilton", 44},
    {"S.Vettel", 5},
    {"M.Verstappen", 33},
    {"D.Ricciardo", 3},
    {"V.Bottas", 77},
    {"K.Räikkönen", 7},
    {"N.Hulkenberg", 27},
    {"C.Sainz", 55},
    {"S.Perez", 11},
    {"E.Ocon", 31},
    {"C.Leclerc", 16},
    {"M.Ericsson", 9},
    {"F.Alonso", 14},
    {"S.Vandoorne", 2},
    {"S.Sirotkin", 35},
    {"L.Stroll", 18},
    {"K.Magnussen", 20},
    {"R.Grosjean", 8},
    {"B.Hartley", 18},
    {"P.Gasly", 10},
  ] |> Enum.map(fn {name, number} ->
    %{name: name, number: number}
  end)

F1.Repo.insert_all(Drivers.Driver, drivers)

