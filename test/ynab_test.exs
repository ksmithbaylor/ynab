defmodule YNABTest do
  use ExUnit.Case
  doctest YNAB.Files

  test "Initializing the sample budget" do
    budget = YNAB.from_budget_dir("test/fixtures/Sample")
    assert %YNAB.Budget{} = budget
    assert budget == YNAB.Budget.from_budget_dir("test/fixtures/Sample")
  end
end
