defmodule Aoc2019 do
  @moduledoc """
  Advent of Code 2019 tasks.
  """

  def day1_part1 do
    "priv/day1.txt"
    |> Aoc2019.Day1.FuelCounter.stream_input_file()
    |> Aoc2019.Day1.FuelCounter.sum_modules()
  end

  def day1_part2 do
    "priv/day1.txt"
    |> Aoc2019.Day1.FuelCounter.stream_input_file()
    |> Aoc2019.Day1.FuelCounter.sum_modules_accounting_for_fuel_mass()
  end
end
