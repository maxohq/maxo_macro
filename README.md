# MaxoMacro

[![Hex.pm](https://img.shields.io/hexpm/v/maxo_macro.svg)](https://hex.pm/packages/maxo_macro)
[![Docs](https://img.shields.io/badge/hexdocs-docs-8e7ce6.svg)](https://hexdocs.pm/maxo_macro)
[![CI](https://github.com/maxohq/maxo_macro/actions/workflows/ci.yml/badge.svg)](https://github.com/maxohq/maxo_macro/actions/workflows/ci.yml)

`MaxoMacro` provides useful macros to simplify your code.

## Usage

`MaxoMacro.import_with_delegates` generates public delegates for all functions on the source module.

```elixir
defmodule Source do
  def hey(name), do: "Hey, #{name}!"
end

defmodule Target do
  require MaxoMacro
  MaxoMacro.import_with_delegates(Source)
end
Target.hey("Joe")
# => Hey, Joe!
```

## Installation

The package can be installed by adding `maxo_macro` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:maxo_macro, "~> 0.1"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/maxo_macro>.
