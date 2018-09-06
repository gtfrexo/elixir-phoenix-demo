defmodule Db.Pool_Resolver do

    alias Db.Pools

    def all(_args, _info) do
        {:ok, Pools.list_pools}
    end

    def find(%{id: id}, _info) do
        case Pools.get_pool!(id) do
            nil -> {:error, "Pool with id #{id} not found."}
            pool -> {:ok, pool}
        end
    end

    def create(args, _info) do
        Pools.create_pool(args)
    end

    def update(%{id: id, pool: pool_params}, _info) do
        Pools.get_pool!(id)
        |> Pools.update_pool(pool_params)
    end

    def delete(%{id: id}, _info) do
        Pools.get_pool!(id)
        |> Pools.delete_pool
    end

end