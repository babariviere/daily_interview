defmodule DailyInterviewTest do
  import DailyInterview.{MatchParen, LongestString}
  use ExUnit.Case
  doctest DailyInterview

  test "longest substring without repeating characters" do
    assert longest_substr("abc") == 3
    assert longest_substr("abrkaabcdefghijjxxx") == 10
    assert longest_substr("pwwkew") == 3
    assert longest_substr("abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba") == 26
  end

  test "matching parentheses" do
    assert valid_paren?("()")
    refute valid_paren?(")")
    refute valid_paren?("(()")
    assert valid_paren?("({[]}){[()]}")
  end
end
