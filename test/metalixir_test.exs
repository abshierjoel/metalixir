defmodule MetalixirTest do
  use ExUnit.Case
  doctest Metalixir

  test "greets the world" do
    assert Metalixir.hello() == :world
  end
end
