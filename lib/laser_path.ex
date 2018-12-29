defmodule LaserPath do
  @moduledoc """
  Documentation for LaserPath.
  """

  alias XmlBuilder, as: X

  @doc """
  Create a svg.

  ## Examples

      > LaserPath.to_svg(body, ww, hh)
      <?xml ...
  """

  def to_svg(body, ww, hh) when is_list(body) do
    attrs = %{
      width:  "#{ww}mm",
      height: "#{hh}mm",
      viewBox: "0 0 #{ww} #{hh}",
      xmlns: "http://www.w3.org/2000/svg",
    }

    X.element(:svg, attrs, body)
    |> X.generate
    |> String.replace_prefix("", ~s{<?xml version="1.0"?>\n})
  end

  def to_svg(body, ww, hh), do: to_svg([body], ww, hh)

  @doc """
  Translate an element or group of elements.

  > LaserPath.translate(body, dx, dy)
  """

  def translate(body, dx, dy) when is_list(body) do
    X.element(:g, %{transform: "translate(#{dx} #{dy})"}, body)
  end

  def translate(body, dx, dy), do: translate([body], dx, dy)

  @doc """
  Rotate an element or group of elements.

  > LaserPath.rotate(body, a, x, y)
  """

  def rotate(body, a, x \\ 0, y \\ 0) when is_list(body) do
    X.element(:g, %{transform: "rotate(#{a} #{x} #{y})"}, body)
  end

  def translate(body, a, x \\ 0, y \\ 0), do: rotate([body], a, x, y)
end

