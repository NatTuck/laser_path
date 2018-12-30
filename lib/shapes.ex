defmodule LaserPath.Shapes do
  alias LaserPath.Path

  def circle(r) do
    Path.start
    |> Path.circle(r)
    |> Path.to_x
  end

  def rect(w, h) do
    Path.start(-w/2, -h/2)
    |> Path.line_to(w, 0)
    |> Path.line_to(0, h)
    |> Path.line_to(-w, 0)
    |> Path.to_x
  end
end
