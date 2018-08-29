defmodule DbWeb.HostController do
  use DbWeb, :controller

  alias Db.Hosts
  alias Db.Hosts.Host

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    hosts = Hosts.list_hosts()
    render(conn, "index.json", hosts: hosts)
  end

  def create(conn, %{"host" => host_params}) do
    with {:ok, %Host{} = host} <- Hosts.create_host(host_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", host_path(conn, :show, host))
      |> render("show.json", host: host)
    end
  end

  def show(conn, %{"id" => id}) do
    host = Hosts.get_host!(id)
    render(conn, "show.json", host: host)
  end

  def update(conn, %{"id" => id, "host" => host_params}) do
    host = Hosts.get_host!(id)

    with {:ok, %Host{} = host} <- Hosts.update_host(host, host_params) do
      render(conn, "show.json", host: host)
    end
  end

  def delete(conn, %{"id" => id}) do
    host = Hosts.get_host!(id)
    with {:ok, %Host{}} <- Hosts.delete_host(host) do
      send_resp(conn, :no_content, "")
    end
  end
end
