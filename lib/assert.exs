defmodule Assertion do
  # {:--, [context: Elixir, import: Keynel], [5, 5]}
  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end

    quote do
      Assertion.Test.assert(unquote(operator), unquote(lhs), unquote(rhs))
    end
  end
end
