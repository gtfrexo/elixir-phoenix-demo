defmodule Db.Venue_Resolver do

    alias Db.Venues

    def all(_args, _info) do
        {:ok, Venues.list_venues}
    end

    def find(%{id: id}, _info) do
        case Venues.get_venue!(id) do
            nil -> {:error, "Venue with id #{id} not found."}
            venue -> {:ok, venue}
        end
    end

    def create(args, _info) do
        Venues.create_venue(args)
    end

    def update(%{id: id, venue: venue_params}, _info) do
        Venues.get_venue!(id)
        |> Venues.update_venue(venue_params)
    end

    def delete(%{id: id}, _info) do
        Venues.get_venue!(id)
        |> Venues.delete_venue
    end

end