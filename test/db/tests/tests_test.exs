defmodule Db.TestsTest do
  use Db.DataCase

  alias Db.Tests

  describe "tests" do
    alias Db.Tests.Test

    @valid_attrs %{testing: "some testing"}
    @update_attrs %{testing: "some updated testing"}
    @invalid_attrs %{testing: nil}

    def test_fixture(attrs \\ %{}) do
      {:ok, test} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tests.create_test()

      test
    end

    test "list_tests/0 returns all tests" do
      test = test_fixture()
      assert Tests.list_tests() == [test]
    end

    test "get_test!/1 returns the test with given id" do
      test = test_fixture()
      assert Tests.get_test!(test.id) == test
    end

    test "create_test/1 with valid data creates a test" do
      assert {:ok, %Test{} = test} = Tests.create_test(@valid_attrs)
      assert test.testing == "some testing"
    end

    test "create_test/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tests.create_test(@invalid_attrs)
    end

    test "update_test/2 with valid data updates the test" do
      test = test_fixture()
      assert {:ok, test} = Tests.update_test(test, @update_attrs)
      assert %Test{} = test
      assert test.testing == "some updated testing"
    end

    test "update_test/2 with invalid data returns error changeset" do
      test = test_fixture()
      assert {:error, %Ecto.Changeset{}} = Tests.update_test(test, @invalid_attrs)
      assert test == Tests.get_test!(test.id)
    end

    test "delete_test/1 deletes the test" do
      test = test_fixture()
      assert {:ok, %Test{}} = Tests.delete_test(test)
      assert_raise Ecto.NoResultsError, fn -> Tests.get_test!(test.id) end
    end

    test "change_test/1 returns a test changeset" do
      test = test_fixture()
      assert %Ecto.Changeset{} = Tests.change_test(test)
    end
  end
end
