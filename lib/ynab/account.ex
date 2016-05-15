defmodule YNAB.Account do
  alias YNAB.Transaction

  @derive [Poison.Encoder]
  defstruct [
    :accountName,
    :onBudget,
    :entityVersion,
    :lastEnteredCheckNumber,
    :hidden,
    :entityId,
    :note,
    :lastReconciledDate,
    :sortableIndex,
    :entityType,
    :accountType,
    :lastReconciledBalance
  ]

  @table Application.get_env(:ynab, :ets_table)

  def active?(account) do
    account.onBudget && !account.hidden
  end

  def balance(account) do
    account.lastReconciledBalance
  end

  def transactions(account) do
    :ets.match(@table, {:"_", "transaction", %Transaction{accountId: account.entityId}})
  end
end
