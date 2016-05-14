defmodule YNAB.Budget do
  alias YNAB.Transactions
  alias YNAB.Transaction
  alias YNAB.Accounts
  alias YNAB.Account
  alias YNAB.Files

  @derive [Poison.Encoder]
  defstruct [:transactions, :accounts]

  def from_budget_dir(ynab_dir) do
    ynab_dir |> Files.latest_budget_file |> File.read! |> from_json
  end

  def from_json(json) do
    json |> Poison.decode!(as: %__MODULE__{
      transactions: [%Transaction{}],
      accounts: [%Account{}]
    })
  end

  def on_budget_balance(%__MODULE__{transactions: transactions, accounts: accounts}) do
    accounts
    |> Accounts.only_active
    |> Transactions.for_accounts(transactions)
    |> Transactions.sum
  end
end
