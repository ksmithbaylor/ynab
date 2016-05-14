defmodule YNAB.Transaction do
  alias YNAB.Dates

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

  def valid?(transaction) do
    !transaction.isTombstone
  end

  def date(transaction) do
    Dates.parse_date(transaction.date)
    |> :calendar.gregorian_days_to_date
  end
end
