defmodule MaxoMacro do
  alias MaxoMacro.ImportWithDelegates

  defmacro import_with_delegates(module) do
    ImportWithDelegates.run(module, __CALLER__)
  end
end
