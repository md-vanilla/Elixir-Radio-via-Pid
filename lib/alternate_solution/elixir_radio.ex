defmodule ElixirInteractor do
  # spawn Station {FM, 900} # starts the stream ... nothing sent by default
  # spawn Station {FM, 969} # starts the stream
  # spawn Station {AM, 1500} # starts the stream
  # spawn ElixirRadio {FM,900}
end

defmodule ElixirCarRadio do
  # car radio can connect to a station.
  # car radio can disconnect from a station.
  # car radio can be connected to no valid station.
  # car radio can be off.
  # car radio turns on and goes connects back to previous connected station.
  # car radio lost power and defaults to FM600.
  def loop() do
    receive do
      {:connect, msg}  -> "will match" <> " " <> msg |> IO.inspect;loop()
      {:connect, msg} ->  "wont match" <> " " <> msg |> IO.inspect;loop()
      {:disconnect} -> "disconnected"
      {:disconnect, _msg} -> "disconnected"
      {_, _msg} -> "invalid pattern sent to loop in Elixir Radio" |> IO.inspect; loop()
    end
  end
end
send self(), {:connect, "connect reached"} |> IO.inspect()
send self(), {:disconnect, "disconnect reached"} |> IO.inspect()

ElixirRadio.loop()

defmodule Station do
  # 1) each station will only know about itself.
  # 2) each station recieves messages "on" and "off".
  # 3) station registers itself to pubsub registry
  # 4) station brodcasts itself and others the top of its infinate cycle.
  # 5) when a radio sends "on" the station add that radio to a pubsub registry.

  def stream do
    Stream.cycle(1..10)
  end
end
