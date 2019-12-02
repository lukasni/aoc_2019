defmodule Aoc2019.Day2.IntcodeComputer do
  def opcode([1 | [first | [second | [dest | _]]]], mem) do
    sum = Enum.at(mem, first) + Enum.at(mem, second)
    {:run, List.replace_at(mem, dest, sum)}
  end

  def opcode([2 | [first | [second | [dest | _]]]], mem) do
    product = Enum.at(mem, first) * Enum.at(mem, second)
    {:run, List.replace_at(mem, dest, product)}
  end

  def opcode([99 | _], mem) do
    {:halt, mem}
  end

  def opcode(_, mem) do
    {:halt, mem}
  end

  def run(program) when is_list(program) do
    {:run, program}
    |> run(0)
  end

  def run({:halt, program}, _index) do
    program
  end

  def run({:run, program}, index) do
    Enum.slice(program, index, 4)
    |> opcode(program)
    |> run(index + 4)
  end

  def read(path) do
    path
    |> File.read!()
    |> String.split(",")
    |> Enum.map(fn i ->
      {mass, _} = Integer.parse(i)
      mass
    end)
  end
end
