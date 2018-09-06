defmodule Db.Person_Resolver do

    alias Db.Persons

    def all(_args, _info) do
        {:ok, Persons.list_persons}
    end

    def find(%{id: id}, _info) do
        case Persons.get_person!(id) do
            nil -> {:error, "Person with id #{id} not found."}
            person -> {:ok, person}
        end
    end

    def create(args, _info) do
        Persons.create_person(args)
    end

    def update(%{id: id, person: person_params}, _info) do
        Persons.get_person!(id)
        |> Persons.update_person(person_params)
    end

    def delete(%{id: id}, _info) do
        Persons.get_person!(id)
        |> Persons.delete_person
    end

end