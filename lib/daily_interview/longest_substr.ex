defmodule DailyInterview.LongestSubstr do
  @moduledoc """
  Implementation for searching the longest substring without repeating characters.
  """

  @doc """
  Calculate the longest substr in a string.

  E.g. longest_substr("abrkaabcdefghijjxxx") == 10
  """
  @spec longest_substr(String.t()) :: integer
  def longest_substr(s) when is_binary(s), do: longest_substr(String.graphemes(s))

  def longest_substr(s) do
    case unique_substr(s) do
      {x, []} -> x
      {x, s} -> max(x, longest_substr(s))
    end
  end

  # Return the length of the first unique substring.
  # Second return parameter is the rest of the string.
  @spec unique_substr(str :: [binary], set :: MapSet, length :: integer) :: {integer, [binary]}
  defp unique_substr(str, set \\ MapSet.new(), length \\ 0)

  defp unique_substr([c | str], set, length) do
    if MapSet.member?(set, c) do
      {length, [c | str]}
    else
      unique_substr(str, MapSet.put(set, c), length + 1)
    end
  end

  defp unique_substr([], _, length), do: {length, []}
end
