defmodule MaxoMacro.Check2 do
  defmodule Source2 do
    def i_am_different!(), do: "Yes, I am!"
  end
end

defmodule MaxoMacro.Check do
  defmodule Source do
    def hey, do: "ho"
    def lets, do: "go"
    def with_args(a, b, c), do: a + b + c
    def with_defaults(a, b \\ 2), do: a + b
  end

  defmodule Target do
    alias MaxoMacro.Check2.Source2, warn: false
    require MaxoMacro
    MaxoMacro.import_with_delegates(Source)
    MaxoMacro.import_with_delegates(Source2)

    def hello do
      hey()
    end
  end
end
