defmodule Db.Version_Resolver do

    alias Db.Versions

    def all(_args, _info) do
        {:ok, Versions.list_versions}
    end

    def find(%{id: id}, _info) do
        case Versions.get_version!(id) do
            nil -> {:error, "Version with id #{id} not found."}
            version -> {:ok, version}
        end
    end

    def create(args, _info) do
        Versions.create_version(args)
    end

    def update(%{id: id, version: version_params}, _info) do
        Versions.get_version!(id)
        |> Versions.update_version(version_params)
    end

    def delete(%{id: id}, _info) do
        Versions.get_version!(id)
        |> Versions.delete_version
    end

end