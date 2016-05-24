defmodule YNABFilesTest do
  use ExUnit.Case
  doctest YNAB.Files

  test "finding the right file in the fixtures directory" do
    actual = YNAB.Files.latest_budget_file("test/fixtures")
    expected = "test/fixtures/sample_budget.yfull"
    assert actual == expected, "somehow found the wrong file?"
  end
end
