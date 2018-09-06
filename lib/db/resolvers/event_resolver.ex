defmodule Db.Event_Resolver do

    alias Db.Events

    def all(_args, _info) do
        {:ok, Events.list_events}
    end

    def find(%{id: id}, _info) do
        case Events.get_event!(id) do
            nil -> {:error, "Event with id #{id} not found."}
            event -> {:ok, event}
        end
    end

    def create(args, _info) do
        Events.create_event(args)
    end

    def update(%{id: id, event: event_params}, _info) do
        Events.get_event!(id)
        |> Events.update_event(event_params)
    end

    def delete(%{id: id}, _info) do
        Events.get_event!(id)
        |> Events.delete_event
    end

end