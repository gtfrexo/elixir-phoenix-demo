defmodule Db.Context_Val_Resolver do

    alias Db.Context_Vals

    def all(_args, _info) do
        {:ok, Context_Vals.list_context_vals}
    end

    def find(%{id: id}, _info) do
        case Context_Vals.get_context__val!(id) do
            nil -> {:error, "Context_Val with id #{id} not found."}
            context_val -> {:ok, context_val}
        end
    end

    def create(args, _info) do
        Context_Vals.create_context__val(args)
    end

    def update(%{id: id, context_val: context_val_params}, _info) do
        Context_Vals.get_context__val!(id)
        |> Context_Vals.update_context__val(context_val_params)
    end

    def delete(%{id: id}, _info) do
        Context_Vals.get_context__val!(id)
        |> Context_Vals.delete_context__val
    end

end