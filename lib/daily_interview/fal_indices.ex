defmodule DailyInterview.FalIndices do
  @moduledoc """
  Find first and last indices from an array for a target.
  """

  @doc """
  Get indices of target in the array.
  """
  def get_indices(arr, target), do: get_indices(arr, target, 0, {-1, -1})

  # Match first index.
  defp get_indices([head | tail], target, idx, {-1, -1}) when head == target,
    do: get_indices(tail, target, idx + 1, {idx, -1})

  # Match last index.
  defp get_indices([head | tail], target, idx, {first, _last}) when head == target and first >= 0,
    do: get_indices(tail, target, idx + 1, {first, idx})

  # Ignore values before first index.
  defp get_indices([_head | tail], target, idx, {-1, -1}),
    do: get_indices(tail, target, idx + 1, {-1, -1})

  defp get_indices(_arr, _target, _idx, res), do: res
end
