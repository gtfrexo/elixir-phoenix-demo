defmodule DbWeb.Context_ValControllerTest do
  use DbWeb.ConnCase

  alias Db.Context_Vals
  alias Db.Context_Vals.Context_Val

  @create_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", emoji_blurb: "some emoji_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some worst_pickup_blurb"}
  @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", emoji_blurb: "some updated emoji_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated worst_pickup_blurb"}
  @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, emoji_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil}

  def fixture(:context__val) do
    {:ok, context__val} = Context_Vals.create_context__val(@create_attrs)
    context__val
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all context_vals", %{conn: conn} do
      conn = get conn, context__val_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create context__val" do
    test "renders context__val when data is valid", %{conn: conn} do
      conn = post conn, context__val_path(conn, :create), context__val: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, context__val_path(conn, :show, id)
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
      conn = post conn, context__val_path(conn, :create), context__val: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update context__val" do
    setup [:create_context__val]

    test "renders context__val when data is valid", %{conn: conn, context__val: %Context_Val{id: id} = context__val} do
      conn = put conn, context__val_path(conn, :update, context__val), context__val: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, context__val_path(conn, :show, id)
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

    test "renders errors when data is invalid", %{conn: conn, context__val: context__val} do
      conn = put conn, context__val_path(conn, :update, context__val), context__val: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete context__val" do
    setup [:create_context__val]

    test "deletes chosen context__val", %{conn: conn, context__val: context__val} do
      conn = delete conn, context__val_path(conn, :delete, context__val)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, context__val_path(conn, :show, context__val)
      end
    end
  end

  defp create_context__val(_) do
    context__val = fixture(:context__val)
    {:ok, context__val: context__val}
  end
end
