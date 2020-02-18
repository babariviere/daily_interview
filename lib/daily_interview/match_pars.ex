defmodule DailyInterview.MatchPars do
  @moduledoc """
  Validate parstheses from a string.
  """

  @assoc_pars [
    {"{", "}"},
    {"[", "]"},
    {"(", ")"}
  ]

  @open_pars Enum.map(@assoc_pars, fn pair -> elem(pair, 0) end)
  @close_pars Enum.map(@assoc_pars, fn pair -> elem(pair, 1) end)

  @doc "Validate parentheses matches in a string."
  @spec valid_pars?(String.t()) :: bool
  def valid_pars?(str) when is_binary(str), do: valid_pars?(String.graphemes(str), [])

  # Empty string and empty stack is a valid match.
  def valid_pars?([], []), do: true
  # Else if stack not empty, there is a missing match.
  def valid_pars?([], _), do: false

  # When open pars, push it to the stack.
  def valid_pars?([head | str], stack) when head in @open_pars,
    do: valid_pars?(str, [head | stack])

  # When close pars, match it with open pars.
  def valid_pars?([head | str], [open | stack]) when head in @close_pars do
    valid =
      Enum.find(@assoc_pars, fn assoc -> elem(assoc, 0) == open end)
      |> elem(1) == head

    case valid do
      true -> valid_pars?(str, stack)
      _ -> false
    end
  end

  # When close pars and empty stack -> invalid.
  def valid_pars?([head | _str], []) when head in @close_pars, do: false

  # Else, ignore character
  def valid_pars?([_head | str], stack), do: valid_pars?(str, stack)
end
