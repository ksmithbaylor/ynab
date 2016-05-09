defmodule YNAB.Budget do
  alias YNAB.Transaction

  @derive [Poison.Encoder]
  defstruct [:transactions]

  def from_json(json) do
    json |> Poison.decode!(as: %__MODULE__{
      transactions: [%Transaction{}]
    })
  end

  def valid_transactions(%__MODULE__{transactions: transactions}) do
    transactions |> Enum.filter(fn t -> Transaction.is_valid?(t) end)
  end
end
