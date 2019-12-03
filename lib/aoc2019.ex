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

  def day2_part1 do
    "priv/day2.txt"
    |> Aoc2019.Day2.IntcodeComputer.read()
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> Aoc2019.Day2.IntcodeComputer.run()
    |> hd()
  end

  def day2_part2 do
    program =
      "priv/day2.txt"
      |> Aoc2019.Day2.IntcodeComputer.read()

    output = fn {{noun, verb}, _} -> 100 * noun + verb end

    for noun <- 0..99, verb <- 0..99 do
      {noun, verb}
    end
    |> Stream.map(fn {noun, verb} ->
      res =
        program
        |> List.replace_at(1, noun)
        |> List.replace_at(2, verb)
        |> Aoc2019.Day2.IntcodeComputer.run()
        |> hd()

      {{noun, verb}, res}
    end)
    |> Enum.find(fn {_, res} -> res == 19_690_720 end)
    |> output.()
  end
end
