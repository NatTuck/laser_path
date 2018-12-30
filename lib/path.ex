defmodule LaserPath.Path do
  defstruct cmds: []

  alias LaserPath.Path
  alias XmlBuilder, as: X

  def start(x0 \\ 0, y0 \\ 0) do
    %Path{cmds: [["M", x0, y0]]}
  end

  def push(%Path{cmds: cmds}, cc) do
    %Path{cmds: [cc | cmds]}
  end

  def line_to(path = %Path{}, dx, dy) do
    push(path, ["l", dx, dy])
  end

  def arc_to(path = %Path{}, dx, dy, rx, ry, large \\ 0, sweep \\ 0) do
    push(path, ["a", rx, ry, 0, large, sweep, dx, dy])
  end

  def circle(path = %Path{}, r, sweep \\ 0) do
    path
    |> push(["m", -r, 0])
    |> arc_to(2 * r, 0, r, r, 1, sweep)
    |> arc_to(-2 * r, 0, r, r, 1, sweep)
  end

  def to_x(%Path{cmds: cmds}) do
    d = cmds
    |> Enum.reverse
    |> Enum.map(&(Enum.join(&1, " ")))
    |> Enum.join(" ")

    X.element :path, %{
      :d => "#{d} z",
      :fill => "none",
      :stroke => "black",
      :'stroke-width' => 1,
    }
  end
end
