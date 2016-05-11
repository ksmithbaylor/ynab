defmodule YNAB.Budget do
  alias YNAB.Transaction
  alias YNAB.Files

  @derive [Poison.Encoder]
  defstruct [:transactions]

  def from_budget_dir(ynab_dir) do
    ynab_dir |> Files.latest_budget_file |> File.read! |> from_json
  end

  def from_json(json) do
    json |> Poison.decode!(as: %__MODULE__{
      transactions: [%Transaction{}]
    })
  end

  def valid_transactions(%__MODULE__{transactions: transactions}) do
    transactions |> Enum.filter(fn t -> Transaction.is_valid?(t) end)
  end
end
