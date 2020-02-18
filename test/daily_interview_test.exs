defmodule DailyInterviewTest do
  import DailyInterview.{MatchPars, LongestSubstr}
  use ExUnit.Case
  doctest DailyInterview

  test "longest substring without repeating characters" do
    assert longest_substr("abc") == 3
    assert longest_substr("abrkaabcdefghijjxxx") == 10
    assert longest_substr("pwwkew") == 3
    assert longest_substr("abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba") == 26
  end

  test "matching parentheses" do
    assert valid_pars?("()")
    refute valid_pars?(")")
    refute valid_pars?("(()")
    assert valid_pars?("({[]}){[()]}")
  end
end
