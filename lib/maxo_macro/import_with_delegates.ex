defmodule MaxoMacro.ImportWithDelegates do
  def run(module, caller) do
    {mod, funs} = __MODULE__.extract_functions(module, caller)
    ast = __MODULE__.generate_delegates(funs, mod)

    quote do
      unquote(ast)
    end
  end

  def extract_functions(module_ast, caller) do
    {_, _, mod_parts} = module_ast
    mod = Module.concat(mod_parts)

    # expand aliases!
    expanded_mods = for {a_mod, f_mod} <- caller.aliases, a_mod == mod, do: f_mod
    mod = if expanded_mods == [], do: mod, else: List.first(expanded_mods)
    funs = mod.__info__(:functions)
    {mod, funs}
  end

  def gen_args(0), do: []

  def gen_args(amount) do
    for i <- 1..amount do
      Macro.var(:"arg#{i}", nil)
    end
  end

  def generate_delegates(functions, target) do
    for {fn_name, arity} <- functions do
      args = gen_args(arity)

      quote do
        defdelegate unquote(fn_name)(unquote_splicing(args)), to: unquote(target)
      end
    end
  end
end
