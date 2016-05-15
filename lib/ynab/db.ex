defmodule YNAB.DB do
  use GenServer

  @table Application.get_env(:ynab, :ets_table)

  def init do
    case :ets.info(@table) do
      :undefined ->
        :ets.new(@table, [:set, :public, :named_table])
      _ ->
        :ets.delete_all_objects(@table)
    end
  end

  def insert(entity) do
    :ets.insert(@table, {entity.entityId, entity.entityType, entity})
  end
end
