defmodule YNAB do
  alias YNAB.Budget

  @table Application.get_env(:ynab, :ets_table)

  def init(ynab_dir) do
    init_ets
    budget = ynab_dir |> Budget.from_budget_dir
    budget.transactions |> Enum.map(&insert_entity/1)
    budget.accounts |> Enum.map(&insert_entity/1)
    budget
  end

  defp init_ets do
    case :ets.info(@table) do
      :undefined ->
        :ets.new(@table, [:set, :public, :named_table])
      _ ->
        :ets.delete_all_objects(@table)
    end
  end

  defp insert_entity(entity) do
    :ets.insert(@table, {entity.entityId, entity.entityType, entity})
  end
end
