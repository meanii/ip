defmodule IpTest do
  use ExUnit.Case
  doctest Ip

  test "greets the world" do
    assert Ip.hello() == :world
  end
end
