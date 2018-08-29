defmodule Db.Host_Resolver do

    alias Db.Hosts

    def all(_args, _info) do
        {:ok, Hosts.list_hosts}
    end

    def find(%{id: id}, _info) do
        case Hosts.get_host!(id) do
            nil -> {:error, "Host with id #{id} not found."}
            host -> {:ok, host}
        end
    end

    def create(args, _info) do
        Hosts.create_host(args)
    end

    def update(%{id: id, host: host_params}, _info) do
        Hosts.get_host!(id)
        |> Hosts.update_host(host_params)
    end

    def delete(%{id: id}, _info) do
        Hosts.get_host!(id)
        |> Hosts.delete_host
    end

end