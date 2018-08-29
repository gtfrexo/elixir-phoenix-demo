defmodule DbWeb.GenderControllerTest do
  use DbWeb.ConnCase

  alias Db.Genders
  alias Db.Genders.Gender

  @create_attrs %{is_female: true, is_male: true}
  @update_attrs %{is_female: false, is_male: false}
  @invalid_attrs %{is_female: nil, is_male: nil}

  def fixture(:gender) do
    {:ok, gender} = Genders.create_gender(@create_attrs)
    gender
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all genders", %{conn: conn} do
      conn = get conn, gender_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gender" do
    test "renders gender when data is valid", %{conn: conn} do
      conn = post conn, gender_path(conn, :create), gender: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, gender_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "is_female" => true,
        "is_male" => true}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gender_path(conn, :create), gender: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gender" do
    setup [:create_gender]

    test "renders gender when data is valid", %{conn: conn, gender: %Gender{id: id} = gender} do
      conn = put conn, gender_path(conn, :update, gender), gender: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, gender_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "is_female" => false,
        "is_male" => false}
    end

    test "renders errors when data is invalid", %{conn: conn, gender: gender} do
      conn = put conn, gender_path(conn, :update, gender), gender: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gender" do
    setup [:create_gender]

    test "deletes chosen gender", %{conn: conn, gender: gender} do
      conn = delete conn, gender_path(conn, :delete, gender)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, gender_path(conn, :show, gender)
      end
    end
  end

  defp create_gender(_) do
    gender = fixture(:gender)
    {:ok, gender: gender}
  end
end
