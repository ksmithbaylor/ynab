defmodule YNAB do
  alias YNAB.Budget

  def budget_for(ynab_dir) do
    ynab_dir |> Budget.from_budget_dir
  end
end
