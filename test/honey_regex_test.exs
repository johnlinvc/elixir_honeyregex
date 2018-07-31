defmodule HoneyRegexTest do
  use ExUnit.Case
  doctest HoneyRegex

  test "rotate right" do
    input = """
    12
    123
    12
    """
    output = """
    11
    122
    23
    """
    assert HoneyRegex.rotate(input) == String.trim_trailing(output)
  end
end
