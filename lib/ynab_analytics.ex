defmodule YnabAnalytics do
  def latest_budget_file(ynab_dir) do
    ynab_dir |> all_budget_files |> most_recent_file
  end

  #####

  defp all_budget_files(ynab_dir) do
    Path.wildcard(ynab_dir <> "/**/*.yfull")
  end

  defp most_recent_file(paths) do
    Enum.max_by(paths, fn path -> File.stat!(path).mtime end)
  end
end
