defmodule YNAB.Account do
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

  def active?(account) do
    account.onBudget && !account.hidden
  end

  def balance(account) do
    account.lastReconciledBalance
  end
end
