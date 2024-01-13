defmodule Ip.Routers do
  @moduledoc """
  Documentation for `Ip.Routers`.
  """

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch


  get "/" do
    send_resp(conn, 200, "sup?")
  end

  get "/ip" do
    ip = Enum.join(Tuple.to_list(conn.remote_ip), ".")
    send_resp(conn, 200, ip)
  end

  match _ do
    send_resp(conn, 404, "sup?")
  end

end
