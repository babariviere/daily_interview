defmodule DailyInterviewTest do
  import DailyInterview
  use ExUnit.Case
  doctest DailyInterview

  test "longest substring without repeating characters" do
    assert longest_substr("abc") == 3
    assert longest_substr("abrkaabcdefghijjxxx") == 10
    assert longest_substr("pwwkew") == 3
    assert longest_substr("abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba") == 26
  end
end
