defmodule DbWeb.LocationControllerTest do
  use DbWeb.ConnCase

  alias Db.Locations
  alias Db.Locations.Location

  @create_attrs %{address: "some address", address_full: "some address_full", city: "some city", country: "some country", lat: 120.5, lon: 120.5, state: "some state", zip: "some zip"}
  @update_attrs %{address: "some updated address", address_full: "some updated address_full", city: "some updated city", country: "some updated country", lat: 456.7, lon: 456.7, state: "some updated state", zip: "some updated zip"}
  @invalid_attrs %{address: nil, address_full: nil, city: nil, country: nil, lat: nil, lon: nil, state: nil, zip: nil}

  def fixture(:location) do
    {:ok, location} = Locations.create_location(@create_attrs)
    location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locations", %{conn: conn} do
      conn = get conn, location_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create location" do
    test "renders location when data is valid", %{conn: conn} do
      conn = post conn, location_path(conn, :create), location: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some address",
        "address_full" => "some address_full",
        "city" => "some city",
        "country" => "some country",
        "lat" => 120.5,
        "lon" => 120.5,
        "state" => "some state",
        "zip" => "some zip"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, location_path(conn, :create), location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update location" do
    setup [:create_location]

    test "renders location when data is valid", %{conn: conn, location: %Location{id: id} = location} do
      conn = put conn, location_path(conn, :update, location), location: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some updated address",
        "address_full" => "some updated address_full",
        "city" => "some updated city",
        "country" => "some updated country",
        "lat" => 456.7,
        "lon" => 456.7,
        "state" => "some updated state",
        "zip" => "some updated zip"}
    end

    test "renders errors when data is invalid", %{conn: conn, location: location} do
      conn = put conn, location_path(conn, :update, location), location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete location" do
    setup [:create_location]

    test "deletes chosen location", %{conn: conn, location: location} do
      conn = delete conn, location_path(conn, :delete, location)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, location_path(conn, :show, location)
      end
    end
  end

  defp create_location(_) do
    location = fixture(:location)
    {:ok, location: location}
  end
end
