defmodule DailyInterview.LongestSubstr do
  @moduledoc """
  Implementation for searching the longest substring without repeating characters.
  """

  @doc """
  Calculate the longest substr in a string.

  E.g. longest_substr("abrkaabcdefghijjxxx") == 10
  """
  @spec longest_substr(String.t()) :: integer
  def longest_substr(s) when is_binary(s),
    do: longest_substr(String.graphemes(s), MapSet.new(), 0)

  defp longest_substr([c | str], set, length) do
    case MapSet.member?(set, c) do
      true ->
        longest_substr([c | str], MapSet.new(), 0)
        |> max(length)

      _ ->
        longest_substr(str, MapSet.put(set, c), length + 1)
    end
  end

  defp longest_substr([], _set, length), do: length
end
