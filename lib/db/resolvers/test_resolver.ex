defmodule Db.Test_Resolver do

    alias Db.Tests

    def all(_args, _info) do
        {:ok, Tests.list_tests}
    end

    def find(%{id: id}, _info) do
        case Tests.get_test!(id) do
            nil -> {:error, "Test with id #{id} not found."}
            test -> {:ok, test}
        end
    end

    def create(args, _info) do
        Tests.create_test(args)
    end

    def update(%{id: id, test: test_params}, _info) do
        Tests.get_test!(id)
        |> Tests.update_test(test_params)
    end

    def delete(%{id: id}, _info) do
        Tests.get_test!(id)
        |> Tests.delete_test
    end

end