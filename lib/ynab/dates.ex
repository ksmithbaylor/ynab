defmodule YNAB.Dates do
  def day_difference(a, b) do
    parse_date(a) - parse_date(b)
  end

  def parse_date(string) do
    string
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
    |> :calendar.date_to_gregorian_days
  end
end
