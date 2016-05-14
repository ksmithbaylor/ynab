defmodule YNAB.Transactions do
  alias YNAB.Account
  alias YNAB.Transaction

  def for_accounts(accounts, transactions) do
    accounts
    |> Enum.flat_map(fn account ->
      for_account(transactions, account)
    end)
  end

  def for_account(transactions, %Account{entityId: accountId}) do
    only_valid(transactions) |> with_account_id(accountId)
  end

  def only_valid(transactions) do
    transactions |> Enum.filter(& Transaction.valid?(&1))
  end

  def with_account_id(transactions, accountId) do
    transactions |> Enum.filter(& &1.accountId == accountId)
  end

  def sum(transactions) do
    transactions
    |> Enum.map(& &1.amount)
    |> currency_sum
  end

  defp currency_sum(amounts) do
    bigSum = amounts
             |> Enum.map(& round(&1 * 100))
             |> Enum.sum
    bigSum / 100
  end
end
