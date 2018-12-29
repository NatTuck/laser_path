defmodule LaserPathTest do
  use ExUnit.Case
  doctest LaserPath

  alias LaserPath, as: LP
  alias LP.Shapes

  test "simple circle" do
    text = Shapes.circle(10)
    |> LP.translate(25, 25)
    |> LP.to_svg(50, 50)

    assert(text =~ ~r/^<\?xml/)
    assert(text =~ ~r/svg/)
    assert(text =~ ~r/g/)
    assert(text =~ ~r/path/)
    assert(text =~ ~r/translate\(25 25\)/)
  end
end
