defmodule DbWeb.VersionControllerTest do
  use DbWeb.ConnCase

  alias Db.Versions
  alias Db.Versions.Version

  @create_attrs %{current_version: "some current_version", target_version: "some target_version"}
  @update_attrs %{current_version: "some updated current_version", target_version: "some updated target_version"}
  @invalid_attrs %{current_version: nil, target_version: nil}

  def fixture(:version) do
    {:ok, version} = Versions.create_version(@create_attrs)
    version
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all versions", %{conn: conn} do
      conn = get conn, version_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create version" do
    test "renders version when data is valid", %{conn: conn} do
      conn = post conn, version_path(conn, :create), version: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, version_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "current_version" => "some current_version",
        "target_version" => "some target_version"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, version_path(conn, :create), version: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update version" do
    setup [:create_version]

    test "renders version when data is valid", %{conn: conn, version: %Version{id: id} = version} do
      conn = put conn, version_path(conn, :update, version), version: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, version_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "current_version" => "some updated current_version",
        "target_version" => "some updated target_version"}
    end

    test "renders errors when data is invalid", %{conn: conn, version: version} do
      conn = put conn, version_path(conn, :update, version), version: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete version" do
    setup [:create_version]

    test "deletes chosen version", %{conn: conn, version: version} do
      conn = delete conn, version_path(conn, :delete, version)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, version_path(conn, :show, version)
      end
    end
  end

  defp create_version(_) do
    version = fixture(:version)
    {:ok, version: version}
  end
end
