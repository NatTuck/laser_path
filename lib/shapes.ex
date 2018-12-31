defmodule LaserPath.Shapes do
  alias LaserPath.Path

  def circle(r, attrs \\ %{}) do
    Path.start
    |> Path.circle(r)
    |> Path.to_x(attrs)
  end

  def rect(w, h, attrs \\ %{}) do
    Path.start(-w/2, -h/2)
    |> Path.line_to(w, 0)
    |> Path.line_to(0, h)
    |> Path.line_to(-w, 0)
    |> Path.to_x(attrs)
  end
end
