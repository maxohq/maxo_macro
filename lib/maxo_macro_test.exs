defmodule MaxoMacroTest do
  use ExUnit.Case
  use MnemeDefaults

  describe "import_with_delegates" do
    defmodule Source do
      def hey, do: "ho"
      def lets, do: "go"
      def with_args(a, b, c), do: a + b + c
      def with_defaults(a, b \\ 2), do: a + b
    end

    defmodule Source.Inner do
      def i_am_different!(), do: "Yes, I am!"
    end

    defmodule Target do
      require MaxoMacro
      alias Source.Inner
      MaxoMacro.import_with_delegates(MaxoMacroTest.Source)
      MaxoMacro.import_with_delegates(Inner)
    end

    test "works with aliases" do
      assert Target.hey() == "ho"
      assert Target.lets() == "go"
      assert Target.with_args(1, 2, 3) == 6
      assert Target.with_defaults(1, 1) == 2
      assert Target.with_defaults(1) == 3
      assert Target.i_am_different!() == "Yes, I am!"
    end
  end
end
