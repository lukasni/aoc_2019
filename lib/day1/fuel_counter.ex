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

  def sum_modules_accounting_for_fuel_mass(modules) do
    modules
    |> Enum.reduce(0, fn module, acc ->
      acc + account_for_fuel_mass(module)
    end)
    |> trunc()
  end

  def account_for_fuel_mass(module_mass) do
    recurse_fuel(module_mass, 0)
  end

  defp recurse_fuel(mass, acc) do
    case module_fuel(mass) do
      m when m > 0 ->
        recurse_fuel(m, acc + m)

      _m ->
        acc
    end
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
