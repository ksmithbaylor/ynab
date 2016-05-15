defmodule YNAB.DB do
  use GenServer
  alias YNAB.Transaction
  alias YNAB.Account

  @table Application.get_env(:ynab, :ets_table)

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def insert(entity) do
    GenServer.cast(__MODULE__, {:insert, entity})
  end

  # Callbacks

  def init(:ok) do
    case :ets.info(@table) do
      :undefined ->
        :ets.new(@table, [:set, :public, :named_table])
      _ ->
        :ets.delete_all_objects(@table)
    end
    {:ok, @table}
  end

  def handle_cast({:insert, entity}, _table) do
    :ets.insert(@table, {entity.entityId, entity.entityType, entity})
    {:noreply, @table}
  end
end
