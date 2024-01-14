defmodule Ip.Routers do
  @moduledoc """
  Documentation for `Ip.Routers`.
  """

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch


  get "/" do
    ip = Utils.Misc.get_ip(conn)
    send_resp(conn, 200, ip)
  end

  get "/ip" do
    ip = Utils.Misc.get_ip(conn)
    send_resp(conn, 200, ip)
  end

  match _ do
    ip = Utils.Misc.get_ip(conn)
    send_resp(conn, 200, ip)
  end

end
