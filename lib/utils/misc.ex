defmodule Utils.Misc do
  @moduledoc """
  Documentation for `Utils.Misc`.
  """
  @nginx_header "x-forwarded-for"

  @doc """
  Get the IP address of the client.
  """
  @spec get_ip(Plug.Conn.t) :: String.t
  def get_ip(conn) do
    if conn.remote_ip == {127, 0, 0, 1} do # localhost
      conn.remote_ip |> Tuple.to_list |> Enum.join(".")
    else # behind a proxy
      Enum.find(conn.req_headers, fn {k, _} -> k == @nginx_header end) |> elem(1)
    end
  end

end
