defmodule Db.Gender_Resolver do

    alias Db.Genders

    def all(_args, _info) do
        {:ok, Genders.list_genders}
    end

    def find(%{id: id}, _info) do
        case Genders.get_gender!(id) do
            nil -> {:error, "Gender with id #{id} not found."}
            gender -> {:ok, gender}
        end
    end

    def create(args, _info) do
        Genders.create_gender(args)
    end

    def update(%{id: id, gender: gender_params}, _info) do
        Genders.get_gender!(id)
        |> Genders.update_gender(gender_params)
    end

    def delete(%{id: id}, _info) do
        Genders.get_gender!(id)
        |> Genders.delete_gender
    end

end