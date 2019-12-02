defmodule Aoc2019.Day1Test do
  use ExUnit.Case

  alias Aoc2019.Day1.FuelCounter

  describe "Part 1 module fuel" do
    test "it should calculate the fuel requirement for individual modules" do
      assert FuelCounter.module_fuel(12) == 2
      assert FuelCounter.module_fuel(14) == 2
      assert FuelCounter.module_fuel(1969) == 654
      assert FuelCounter.module_fuel(100_756) == 33_583
    end

    test "it should sum the fuel requirement of a list of modules" do
      modules = [12,14,1969,100_756]
      expected_fuel = 2 + 2 + 654 + 33_583

      assert FuelCounter.sum_modules(modules) == expected_fuel
    end
  end

  describe "Part 2 damn you Tsiolkovsky" do
    test "it should calculate the fuel requirement accounting for fuel mass" do
      assert FuelCounter.account_for_fuel_mass(14) == 2
      assert FuelCounter.account_for_fuel_mass(1969) == 966
      assert FuelCounter.account_for_fuel_mass(100_756) == 50_346
    end
  end
end
