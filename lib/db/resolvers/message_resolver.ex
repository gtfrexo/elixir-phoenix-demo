defmodule Db.Message_Resolver do

    alias Db.Messages

    def all(_args, _info) do
        {:ok, Messages.list_messages}
    end

    def find(%{id: id}, _info) do
        case Messages.get_message!(id) do
            nil -> {:error, "Message with id #{id} not found."}
            message -> {:ok, message}
        end
    end

    def create(args, _info) do
        Messages.create_message(args)
    end

    def update(%{id: id, message: message_params}, _info) do
        Messages.get_message!(id)
        |> Messages.update_message(message_params)
    end

    def delete(%{id: id}, _info) do
        Messages.get_message!(id)
        |> Messages.delete_message
    end

end