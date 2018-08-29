defmodule Db.HostsTest do
  use Db.DataCase

  alias Db.Hosts

  describe "hosts" do
    alias Db.Hosts.Host

    @valid_attrs %{description: "some description", name: "some name", name_full: "some name_full"}
    @update_attrs %{description: "some updated description", name: "some updated name", name_full: "some updated name_full"}
    @invalid_attrs %{description: nil, name: nil, name_full: nil}

    def host_fixture(attrs \\ %{}) do
      {:ok, host} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hosts.create_host()

      host
    end

    test "list_hosts/0 returns all hosts" do
      host = host_fixture()
      assert Hosts.list_hosts() == [host]
    end

    test "get_host!/1 returns the host with given id" do
      host = host_fixture()
      assert Hosts.get_host!(host.id) == host
    end

    test "create_host/1 with valid data creates a host" do
      assert {:ok, %Host{} = host} = Hosts.create_host(@valid_attrs)
      assert host.description == "some description"
      assert host.name == "some name"
      assert host.name_full == "some name_full"
    end

    test "create_host/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hosts.create_host(@invalid_attrs)
    end

    test "update_host/2 with valid data updates the host" do
      host = host_fixture()
      assert {:ok, host} = Hosts.update_host(host, @update_attrs)
      assert %Host{} = host
      assert host.description == "some updated description"
      assert host.name == "some updated name"
      assert host.name_full == "some updated name_full"
    end

    test "update_host/2 with invalid data returns error changeset" do
      host = host_fixture()
      assert {:error, %Ecto.Changeset{}} = Hosts.update_host(host, @invalid_attrs)
      assert host == Hosts.get_host!(host.id)
    end

    test "delete_host/1 deletes the host" do
      host = host_fixture()
      assert {:ok, %Host{}} = Hosts.delete_host(host)
      assert_raise Ecto.NoResultsError, fn -> Hosts.get_host!(host.id) end
    end

    test "change_host/1 returns a host changeset" do
      host = host_fixture()
      assert %Ecto.Changeset{} = Hosts.change_host(host)
    end
  end
end
