defmodule DailyInterview do
  @moduledoc """
  Documentation for DailyInterview.
  """

  @doc """
  Calculate the longest substr in a string.

  E.g. longest_substr("abrkaabcdefghijjxxx") == 10
  """
  @spec longest_substr(String.t()) :: integer
  def longest_substr(s) when is_binary(s), do: longest_substr(String.graphemes(s))

  def longest_substr(s) do
    case unique_substr(s, MapSet.new()) do
      {x, []} -> x
      {x, s} -> max(x, longest_substr(s))
    end
  end

  # Return the length of the first unique substring.
  # Second return parameter is the rest of the string.
  @spec unique_substr(str :: [binary], set :: MapSet) :: {integer, [binary]}
  defp unique_substr([c | str], set) do
    if MapSet.member?(set, c) do
      {0, [c | str]}
    else
      {i, str} = unique_substr(str, MapSet.put(set, c))
      {i + 1, str}
    end
  end

  defp unique_substr([], _), do: {0, []}
end
