defmodule Db.VersionsTest do
  use Db.DataCase

  alias Db.Versions

  describe "versions" do
    alias Db.Versions.Version

    @valid_attrs %{current_version: "some current_version", target_version: "some target_version"}
    @update_attrs %{current_version: "some updated current_version", target_version: "some updated target_version"}
    @invalid_attrs %{current_version: nil, target_version: nil}

    def version_fixture(attrs \\ %{}) do
      {:ok, version} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Versions.create_version()

      version
    end

    test "list_versions/0 returns all versions" do
      version = version_fixture()
      assert Versions.list_versions() == [version]
    end

    test "get_version!/1 returns the version with given id" do
      version = version_fixture()
      assert Versions.get_version!(version.id) == version
    end

    test "create_version/1 with valid data creates a version" do
      assert {:ok, %Version{} = version} = Versions.create_version(@valid_attrs)
      assert version.current_version == "some current_version"
      assert version.target_version == "some target_version"
    end

    test "create_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Versions.create_version(@invalid_attrs)
    end

    test "update_version/2 with valid data updates the version" do
      version = version_fixture()
      assert {:ok, version} = Versions.update_version(version, @update_attrs)
      assert %Version{} = version
      assert version.current_version == "some updated current_version"
      assert version.target_version == "some updated target_version"
    end

    test "update_version/2 with invalid data returns error changeset" do
      version = version_fixture()
      assert {:error, %Ecto.Changeset{}} = Versions.update_version(version, @invalid_attrs)
      assert version == Versions.get_version!(version.id)
    end

    test "delete_version/1 deletes the version" do
      version = version_fixture()
      assert {:ok, %Version{}} = Versions.delete_version(version)
      assert_raise Ecto.NoResultsError, fn -> Versions.get_version!(version.id) end
    end

    test "change_version/1 returns a version changeset" do
      version = version_fixture()
      assert %Ecto.Changeset{} = Versions.change_version(version)
    end
  end
end
