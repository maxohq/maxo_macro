# Lets start with the `MaxoMacro.import_with_delegates` macro.

defmodule Source do
  def hey(name), do: "Hey, #{name}!"
end

# Include Source module function into Target
defmodule Target do
  require MaxoMacro
  MaxoMacro.import_with_delegates(Source)
end

# Now call the imported functions
Target.hey("Joe")

# Enjoy using it! 💜
