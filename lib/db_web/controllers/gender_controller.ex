defmodule DbWeb.GenderController do
  use DbWeb, :controller

  alias Db.Genders
  alias Db.Genders.Gender

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    genders = Genders.list_genders()
    render(conn, "index.json", genders: genders)
  end

  def create(conn, %{"gender" => gender_params}) do
    with {:ok, %Gender{} = gender} <- Genders.create_gender(gender_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", gender_path(conn, :show, gender))
      |> render("show.json", gender: gender)
    end
  end

  def show(conn, %{"id" => id}) do
    gender = Genders.get_gender!(id)
    render(conn, "show.json", gender: gender)
  end

  def update(conn, %{"id" => id, "gender" => gender_params}) do
    gender = Genders.get_gender!(id)

    with {:ok, %Gender{} = gender} <- Genders.update_gender(gender, gender_params) do
      render(conn, "show.json", gender: gender)
    end
  end

  def delete(conn, %{"id" => id}) do
    gender = Genders.get_gender!(id)
    with {:ok, %Gender{}} <- Genders.delete_gender(gender) do
      send_resp(conn, :no_content, "")
    end
  end
end
