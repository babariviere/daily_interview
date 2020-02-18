defmodule DailyInterview.MatchParen do
  @moduledoc """
  Validate parentheses from a string.
  """

  @assoc_paren [
    {"{", "}"},
    {"[", "]"},
    {"(", ")"}
  ]

  @doc "Validate parentheses matches in a string."
  @spec valid_paren?(String.t()) :: bool
  def valid_paren?(str)

  def valid_paren?(str) when is_binary(str), do: valid_paren?(String.graphemes(str))
  def valid_paren?([]), do: true

  def valid_paren?([c | str]) do
    cond do
      paren_open?(c) ->
        {valid, rest} = find_match(str, c)
        valid and valid_paren?(rest)

      # no matching open paren
      paren_close?(c) ->
        false

      true ->
        valid_paren?(str)
    end
  end

  # Match open with close parentheses
  defp paren_match?(op, cl) do
    Enum.find(@assoc_paren, fn assoc -> elem(assoc, 0) == op end)
    |> elem(1) == cl
  end

  defp paren_open?(c) do
    Enum.any?(@assoc_paren, fn assoc -> c == elem(assoc, 0) end)
  end

  def paren_close?(c) do
    Enum.any?(@assoc_paren, fn assoc -> c == elem(assoc, 1) end)
  end

  defp find_match([c | str], op) do
    cond do
      paren_close?(c) ->
        {paren_match?(op, c), str}

      paren_open?(c) ->
        {valid, rest} = find_match(str, c)

        unless valid do
          {valid, rest}
        else
          find_match(rest, op)
        end

      true ->
        find_match(str, op)
    end
  end

  defp find_match([], _op), do: {false, []}
end
