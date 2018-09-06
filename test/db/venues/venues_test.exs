defmodule Db.VenuesTest do
  use Db.DataCase

  alias Db.Venues

  describe "venues" do
    alias Db.Venues.Venue

    @valid_attrs %{category: "some category", description: "some description", name: "some name", name_full: "some name_full"}
    @update_attrs %{category: "some updated category", description: "some updated description", name: "some updated name", name_full: "some updated name_full"}
    @invalid_attrs %{category: nil, description: nil, name: nil, name_full: nil}

    def venue_fixture(attrs \\ %{}) do
      {:ok, venue} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Venues.create_venue()

      venue
    end

    test "list_venues/0 returns all venues" do
      venue = venue_fixture()
      assert Venues.list_venues() == [venue]
    end

    test "get_venue!/1 returns the venue with given id" do
      venue = venue_fixture()
      assert Venues.get_venue!(venue.id) == venue
    end

    test "create_venue/1 with valid data creates a venue" do
      assert {:ok, %Venue{} = venue} = Venues.create_venue(@valid_attrs)
      assert venue.category == "some category"
      assert venue.description == "some description"
      assert venue.name == "some name"
      assert venue.name_full == "some name_full"
    end

    test "create_venue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Venues.create_venue(@invalid_attrs)
    end

    test "update_venue/2 with valid data updates the venue" do
      venue = venue_fixture()
      assert {:ok, venue} = Venues.update_venue(venue, @update_attrs)
      assert %Venue{} = venue
      assert venue.category == "some updated category"
      assert venue.description == "some updated description"
      assert venue.name == "some updated name"
      assert venue.name_full == "some updated name_full"
    end

    test "update_venue/2 with invalid data returns error changeset" do
      venue = venue_fixture()
      assert {:error, %Ecto.Changeset{}} = Venues.update_venue(venue, @invalid_attrs)
      assert venue == Venues.get_venue!(venue.id)
    end

    test "delete_venue/1 deletes the venue" do
      venue = venue_fixture()
      assert {:ok, %Venue{}} = Venues.delete_venue(venue)
      assert_raise Ecto.NoResultsError, fn -> Venues.get_venue!(venue.id) end
    end

    test "change_venue/1 returns a venue changeset" do
      venue = venue_fixture()
      assert %Ecto.Changeset{} = Venues.change_venue(venue)
    end
  end
end
