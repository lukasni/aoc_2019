defmodule Aoc2019.Day1.FuelCounter do

  @doc """
  Calculates the Fuel required for a single module

  To find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.
  """
  def module_fuel(module_mass) do
    module_mass
    |> Kernel./(3)
    |> :math.floor()
    |> Kernel.-(2)
  end

  def sum_modules(modules) do
    modules
    |> Enum.reduce(0, fn module, acc ->
      acc + module_fuel(module)
    end)
  end

  def stream_input_file(path) do
    path
    |> File.stream!()
    |> Stream.map(fn i ->
      {mass, _} = Integer.parse(i)
      mass
    end)
  end
end
