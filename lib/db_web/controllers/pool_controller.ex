defmodule DbWeb.PoolController do
  use DbWeb, :controller

  alias Db.Pools
  alias Db.Pools.Pool

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    pools = Pools.list_pools()
    render(conn, "index.json", pools: pools)
  end

  def create(conn, %{"pool" => pool_params}) do
    with {:ok, %Pool{} = pool} <- Pools.create_pool(pool_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", pool_path(conn, :show, pool))
      |> render("show.json", pool: pool)
    end
  end

  def show(conn, %{"id" => id}) do
    pool = Pools.get_pool!(id)
    render(conn, "show.json", pool: pool)
  end

  def update(conn, %{"id" => id, "pool" => pool_params}) do
    pool = Pools.get_pool!(id)

    with {:ok, %Pool{} = pool} <- Pools.update_pool(pool, pool_params) do
      render(conn, "show.json", pool: pool)
    end
  end

  def delete(conn, %{"id" => id}) do
    pool = Pools.get_pool!(id)
    with {:ok, %Pool{}} <- Pools.delete_pool(pool) do
      send_resp(conn, :no_content, "")
    end
  end
end
