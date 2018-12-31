alias LaserPath, as: LP

defmodule Face do
  def eyebrow do
    LP.Shapes.rect(6, 2)
    |> LP.rotate(30)
    |> LP.translate(0, -10)
  end

  def eye do
    [
      eyebrow(),
      LP.Shapes.circle(4),
    ]
  end

  def face do
    [
      eye() |> LP.translate(-5, 0),
      eye() |> LP.mirror() |> LP.translate(5, 0),
      LP.Shapes.rect(8, 3) |> LP.translate(0, 10),
      LP.Shapes.circle(20, stroke: "blue"),
    ]
  end
end

IO.puts(Face.face() |> LP.translate(20, 20) |> LP.to_svg(80, 80))

