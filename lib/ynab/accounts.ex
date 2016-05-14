defmodule YNAB.Accounts do
  alias YNAB.Account

  def only_active(accounts) do
    accounts |> Enum.filter(&Account.active?/1)
  end
end
