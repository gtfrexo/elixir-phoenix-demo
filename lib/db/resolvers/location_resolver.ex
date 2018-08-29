defmodule Db.Location_Resolver do

    alias Db.Locations

    def all(_args, _info) do
        {:ok, Locations.list_locations}
    end

    def find(%{id: id}, _info) do
        case Locations.get_location!(id) do
            nil -> {:error, "Location with id #{id} not found."}
            location -> {:ok, location}
        end
    end

    def create(args, _info) do
        Locations.create_location(args)
    end

    def update(%{id: id, location: location_params}, _info) do
        Locations.get_location!(id)
        |> Locations.update_location(location_params)
    end

    def delete(%{id: id}, _info) do
        Locations.get_location!(id)
        |> Locations.delete_location
    end

end