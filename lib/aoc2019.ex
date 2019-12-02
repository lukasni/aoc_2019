defmodule Aoc2019 do
  @moduledoc """
  Advent of Code 2019 tasks.
  """

  def day1 do
    "priv/day1.txt"
    |> Aoc2019.Day1.FuelCounter.stream_input_file()
    |> Aoc2019.Day1.FuelCounter.sum_modules()
  end
end
