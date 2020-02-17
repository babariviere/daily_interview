defmodule DailyInterview do
  @moduledoc """
  Documentation for DailyInterview.
  """

  @doc """
  Calculate the longest substr in a string.

  E.g. longest_substr("abrkaabcdefghijjxxx") == 10
  """
  @spec longest_substr(String.t()) :: integer
  def longest_substr(s) when is_binary(s) do
    longest_substr(String.graphemes(s))
  end

  def longest_substr(s) do
    case unique_substr(s) do
      {x, []} -> x
      {0, s} -> longest_substr(s)
      {x, s} -> max(x, longest_substr(s))
    end
  end

  # Return the length of the first unique substring.
  # Second return parameter is the rest of the string.
  @spec unique_substr([binary]) :: {integer, [binary]}
  def unique_substr(s) do
    {:ok, agent} = Agent.start_link(fn -> MapSet.new() end)

    split =
      Enum.split_while(s, fn x ->
        if Agent.get(agent, fn set -> MapSet.member?(set, x) end) do
          false
        else
          Agent.update(agent, fn set -> MapSet.put(set, x) end)
          true
        end
      end)

    {length(elem(split, 0)), elem(split, 1)}
  end
end
