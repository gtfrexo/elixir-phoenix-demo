defmodule DbWeb.PersonControllerTest do
  use DbWeb.ConnCase

  alias Db.Persons
  alias Db.Persons.Person

  @create_attrs %{auth0_me_id: "some auth0_me_id", auth_token: "some auth_token", bio: "some bio", birthday: "2010-04-17 14:00:00.000000Z", email: "some email", email_verified: true, id_token: "some id_token", name: "some name", name_full: "some name_full", target_gender: "some target_gender", target_relationship: "some target_relationship", token: "some token"}
  @update_attrs %{auth0_me_id: "some updated auth0_me_id", auth_token: "some updated auth_token", bio: "some updated bio", birthday: "2011-05-18 15:01:01.000000Z", email: "some updated email", email_verified: false, id_token: "some updated id_token", name: "some updated name", name_full: "some updated name_full", target_gender: "some updated target_gender", target_relationship: "some updated target_relationship", token: "some updated token"}
  @invalid_attrs %{auth0_me_id: nil, auth_token: nil, bio: nil, birthday: nil, email: nil, email_verified: nil, id_token: nil, name: nil, name_full: nil, target_gender: nil, target_relationship: nil, token: nil}

  def fixture(:person) do
    {:ok, person} = Persons.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get conn, person_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "auth0_me_id" => "some auth0_me_id",
        "auth_token" => "some auth_token",
        "bio" => "some bio",
        "birthday" => "2010-04-17 14:00:00.000000Z",
        "email" => "some email",
        "email_verified" => true,
        "id_token" => "some id_token",
        "name" => "some name",
        "name_full" => "some name_full",
        "target_gender" => "some target_gender",
        "target_relationship" => "some target_relationship",
        "token" => "some token"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put conn, person_path(conn, :update, person), person: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "auth0_me_id" => "some updated auth0_me_id",
        "auth_token" => "some updated auth_token",
        "bio" => "some updated bio",
        "birthday" => "2011-05-18 15:01:01.000000Z",
        "email" => "some updated email",
        "email_verified" => false,
        "id_token" => "some updated id_token",
        "name" => "some updated name",
        "name_full" => "some updated name_full",
        "target_gender" => "some updated target_gender",
        "target_relationship" => "some updated target_relationship",
        "token" => "some updated token"}
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put conn, person_path(conn, :update, person), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete conn, person_path(conn, :delete, person)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, person_path(conn, :show, person)
      end
    end
  end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
