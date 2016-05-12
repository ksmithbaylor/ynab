defmodule YNAB.Transactions do
  alias YNAB.Account
  alias YNAB.Transaction

  def only_valid(transactions) do
    transactions
    |> Enum.filter(fn t -> Transaction.valid?(t) end)
  end

  def for_account(transactions, %Account{entityId: accountId}) do
    only_valid(transactions)
    |> Enum.filter(fn t -> t.accountId == accountId end)
  end

  def for_accounts(accounts, transactions) do
    accounts
    |> Enum.flat_map(fn account -> for_account(transactions, account) end)
  end

  def sum(transactions) do
    transactions
    |> Enum.map(fn t -> t.amount end)
    |> Enum.sum
  end
end