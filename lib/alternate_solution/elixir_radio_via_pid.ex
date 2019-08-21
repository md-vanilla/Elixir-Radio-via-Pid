defmodule ElixirRadioViaPid do
  @moduledoc """
  Documentation for ElixirRadioViaPid.
  """

  @doc """
  Station Identification
  ## Examples
      iex> ElixirRadioViaPid.change_station('AM', 600)
      ['AM', 600]
      iex> ElixirRadioViaPid.change_station('AM', 300)
      'incorrect use of radio'
      iex> ElixirRadioViaPid.change_station('FM', 801)
      ['FM', 801]
      iex> ElixirRadioViaPid.change_station('FM', 1300)
      ['FM', 1300]
      iex> ElixirRadioViaPid.change_station('FM', 1500)
      'incorrect use of radio'
      iex> ElixirRadioViaPid.change_station('SATELLITE', 1500)
      'not subscribed for satelite radio'
  """
  def change_station('FM', station) when 800 < station and station < 1400 do
    ['FM', station]
  end
  # def change_station('AM', 500 < station < 1700) do
  def change_station('AM', station) when 500 < station and station < 1700 do
    ['AM', station]
  end
  def change_station('SATELLITE', _station ) do
    'not subscribed for satelite radio'
  end
  def change_station(_broadcast, _station) do
    'incorrect use of radio'
  end
end

ElixirRadioViaPid.change_station('AM', 600) |> IO.inspect()
ElixirRadioViaPid.change_station('AM', 300) |> IO.inspect()
ElixirRadioViaPid.change_station('FM', 801) |> IO.inspect()
ElixirRadioViaPid.change_station('FM', 1300) |> IO.inspect()
ElixirRadioViaPid.change_station('FM', 1500) |> IO.inspect()
ElixirRadioViaPid.change_station('SATELLITE', 1500) |> IO.inspect()
