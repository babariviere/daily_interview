defmodule DailyInterviewTest do
  import DailyInterview.{MatchPars, LongestSubstr, FalIndices}
  alias DailyInterview.LinkedList

  use ExUnit.Case
  doctest DailyInterview

  test "longest substring without repeating characters" do
    assert longest_substr("abc") == 3
    assert longest_substr("abrkaabcdefghijjxxx") == 10
    assert longest_substr("pwwkew") == 3
    assert longest_substr("abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba") == 26
    assert longest_substr("bcaabcdeffedd") == 6
  end

  test "matching parentheses" do
    assert valid_pars?("()")
    refute valid_pars?(")")
    refute valid_pars?("(()")
    assert valid_pars?("({[]}){[()]}")
  end

  test "first and last indices of a target" do
    assert get_indices([1, 1, 2, 3, 4, 5], 6) == {-1, -1}
    assert get_indices([1, 1, 2, 3, 4, 5], 1) == {0, 1}
    assert get_indices([1, 3, 3, 5, 7, 8, 9, 9, 9, 15], 9) == {6, 8}
    assert get_indices([100, 150, 150, 153], 150) == {1, 2}
    assert get_indices([1, 2, 3, 4, 5, 6, 10], 9) == {-1, -1}
  end

  test "reverse linked list" do
    empty = LinkedList.new()

    l1 =
      LinkedList.new()
      |> LinkedList.push(1)
      |> LinkedList.push(2)
      |> LinkedList.push(3)

    l1rev =
      LinkedList.new()
      |> LinkedList.push(3)
      |> LinkedList.push(2)
      |> LinkedList.push(1)

    assert LinkedList.reverse(empty) == empty
    assert LinkedList.reverse(l1) == l1rev
  end
end
