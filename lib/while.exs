defmodule Loop do
  defmacro while(expression, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          if unquote(expression) do
            unquote(block)
          else
            throw(:break)
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw(:break)
end

## test Code
# pid =
#   spawn(fn ->
#     Loop.while true do
#       receive do
#         :stop ->
#           IO.puts("Stopping...")
#           Loop.break()

#         msg ->
#           IO.puts("Got #{inspect(msg)}")
#       end
#     end
#   end)
