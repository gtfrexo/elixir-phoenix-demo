defmodule Db.LocationsTest do
  use Db.DataCase

  alias Db.Locations

  describe "locations" do
    alias Db.Locations.Location

    @valid_attrs %{address: "some address", address_full: "some address_full", city: "some city", country: "some country", lat: 120.5, lon: 120.5, state: "some state", zip: "some zip"}
    @update_attrs %{address: "some updated address", address_full: "some updated address_full", city: "some updated city", country: "some updated country", lat: 456.7, lon: 456.7, state: "some updated state", zip: "some updated zip"}
    @invalid_attrs %{address: nil, address_full: nil, city: nil, country: nil, lat: nil, lon: nil, state: nil, zip: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Locations.create_location(@valid_attrs)
      assert location.address == "some address"
      assert location.address_full == "some address_full"
      assert location.city == "some city"
      assert location.country == "some country"
      assert location.lat == 120.5
      assert location.lon == 120.5
      assert location.state == "some state"
      assert location.zip == "some zip"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = Locations.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.address == "some updated address"
      assert location.address_full == "some updated address_full"
      assert location.city == "some updated city"
      assert location.country == "some updated country"
      assert location.lat == 456.7
      assert location.lon == 456.7
      assert location.state == "some updated state"
      assert location.zip == "some updated zip"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end
