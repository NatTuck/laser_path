defmodule LaserPath.Shapes do
  alias LaserPath.Path

  def circle(r) do
    Path.start
    |> Path.circle(r)
    |> Path.to_x
  end
end
