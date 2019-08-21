defmodule ElixirRadioStation do
  @moduledoc """
  Documentation for ElixirRadioStation.
  """

  @doc """
  Sends out an infinate stream spawned by the Radio, really it should be spawned by a radio tower but w/e.

  A station is always streaming however it:
  1) sends current stream when it receives a message from the radio,
  2) stops sending current stream when receives message from the radio.
  """
  def stream do
    Stream.cycle(1..10)
  end
end
ElixirRadioStation.stream |> Stream.map(&IO.inspect/1) |> Enum.to_list
