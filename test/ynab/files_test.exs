defmodule YNABFilesTest do
  use ExUnit.Case
  doctest YNAB.Files

  test "finding the right file in the fixtures directory" do
    actual = YNAB.Files.latest_budget_file("test/fixtures/Sample")
    expected = "test/fixtures/Sample/data1~F5DA6F59/A9B78645-A18C-D86B-12BF-2BA9A4C65A85/Budget.yfull"
    assert actual == expected
  end
end
