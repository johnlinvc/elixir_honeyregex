defmodule HoneyRegex do
  @moduledoc """
  Documentation for HoneyRegex.
  """

  def rotate(str) do
    lines = str |> String.trim_trailing |> String.split("\n")
    line_chars = lines |> Enum.map(&String.to_charlist/1)
    width = line_chars |> List.first |> length
    {current_lines, rest_lines} = Enum.split(line_chars, width)
    rows = rotate_lines(current_lines, rest_lines)
    rows |> Enum.join("\n")
  end

  def rotate_lines([], rest_lines) do
    []
  end

  def rotate_lines(current_lines, rest_lines) do
    IO.inspect current_lines
    IO.inspect rest_lines
    row_list = current_lines |> Enum.map(&List.first/1)
    rest = current_lines |> Enum.map(fn x -> Enum.drop(x, 1) end)
    # {row_list, rest} = current_lines |> Enum.zip |> Enum.split(1)
    row = row_list |> List.flatten
    new_current = Enum.take(rest_lines, 1) ++ rest
    IO.inspect new_current
    new_non_empty_current = new_current |> Enum.reject(&Enum.empty?/1)
    new_rest_lines = rest_lines |> Enum.drop(1)
    [row | rotate_lines(new_non_empty_current, new_rest_lines)]
  end

end
