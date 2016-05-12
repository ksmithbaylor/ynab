defmodule YNAB.Accounts do
  alias YNAB.Account

  def budget_accounts(accounts) do
    accounts |> Enum.filter(&Account.active?/1)
  end
end
