defmodule DbWeb.Profile_ContentControllerTest do
  use DbWeb.ConnCase

  alias Db.Profile_Contents
  alias Db.Profile_Contents.Profile_Content

  @create_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", emoji_blurb: "some emoji_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some worst_pickup_blurb"}
  @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", emoji_blurb: "some updated emoji_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated worst_pickup_blurb"}
  @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, emoji_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil}

  def fixture(:profile__content) do
    {:ok, profile__content} = Profile_Contents.create_profile__content(@create_attrs)
    profile__content
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all profile_contents", %{conn: conn} do
      conn = get conn, profile__content_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create profile__content" do
    test "renders profile__content when data is valid", %{conn: conn} do
      conn = post conn, profile__content_path(conn, :create), profile__content: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, profile__content_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some animal_blurb",
        "boat_blurb" => "some boat_blurb",
        "education_blurb" => "some education_blurb",
        "eggs_blurb" => "some eggs_blurb",
        "emoji_blurb" => "some emoji_blurb",
        "occupation_blurb" => "some occupation_blurb",
        "worst_pickup_blurb" => "some worst_pickup_blurb"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, profile__content_path(conn, :create), profile__content: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update profile__content" do
    setup [:create_profile__content]

    test "renders profile__content when data is valid", %{conn: conn, profile__content: %Profile_Content{id: id} = profile__content} do
      conn = put conn, profile__content_path(conn, :update, profile__content), profile__content: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, profile__content_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "animal_blurb" => "some updated animal_blurb",
        "boat_blurb" => "some updated boat_blurb",
        "education_blurb" => "some updated education_blurb",
        "eggs_blurb" => "some updated eggs_blurb",
        "emoji_blurb" => "some updated emoji_blurb",
        "occupation_blurb" => "some updated occupation_blurb",
        "worst_pickup_blurb" => "some updated worst_pickup_blurb"}
    end

    test "renders errors when data is invalid", %{conn: conn, profile__content: profile__content} do
      conn = put conn, profile__content_path(conn, :update, profile__content), profile__content: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete profile__content" do
    setup [:create_profile__content]

    test "deletes chosen profile__content", %{conn: conn, profile__content: profile__content} do
      conn = delete conn, profile__content_path(conn, :delete, profile__content)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, profile__content_path(conn, :show, profile__content)
      end
    end
  end

  defp create_profile__content(_) do
    profile__content = fixture(:profile__content)
    {:ok, profile__content: profile__content}
  end
end
