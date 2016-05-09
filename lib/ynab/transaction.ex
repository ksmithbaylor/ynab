defmodule YNAB.Transaction do
  @derive [Poison.Encoder]
  defstruct [
    :accepted,
    :accountId,
    :amount,
    :categoryId,
    :cleared,
    :date,
    :entityId,
    :entityType,
    :entityVersion,
    :isTombstone,
    :payeeId
  ]

  def is_valid?(transaction) do
    !transaction.isTombstone
  end
end
