defmodule YNAB do
  alias YNAB.Budget

  def from_budget_dir(ynab_dir) do
    ynab_dir |> Budget.from_budget_dir
  end
end
