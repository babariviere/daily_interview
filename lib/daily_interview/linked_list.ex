defmodule DailyInterview.LinkedList do
  alias __MODULE__

  @moduledoc """
  A linked list that accepts any value.
  """

  defstruct value: nil, next: nil

  @type t() :: %__MODULE__{
          value: any() | nil,
          next: t() | nil
        }

  @doc """
  Create a new linked list.
  """
  @spec new :: t()
  def new, do: %LinkedList{}

  @doc """
  Push a new element to the linked list.
  Element will be inserted on head.

  ## Example

        LinkedList.new()
        |> LinkedList.push(10)
  """
  @spec push(t(), any()) :: t()
  def push(list, elem), do: %LinkedList{value: elem, next: list}

  @doc """
  Reverse linked list.
  """
  @spec reverse(t()) :: t()
  def reverse(list), do: do_reverse(list, new())

  defp do_reverse(%LinkedList{value: nil, next: nil}, new), do: new

  defp do_reverse(%LinkedList{value: value, next: nil}, new),
    do: %LinkedList{value: value, next: new}

  defp do_reverse(list, new),
    do: do_reverse(list.next, %LinkedList{value: list.value, next: new})
end
