defmodule DailyInterviewTest do
  use ExUnit.Case
  doctest DailyInterview

  test "interview exemple" do
    assert DailyInterview.longest_substr("abrkaabcdefghijjxxx") == 10
  end
end
