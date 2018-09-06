defmodule DbWeb.Profile_ContentController do
  use DbWeb, :controller

  alias Db.Profile_Contents
  alias Db.Profile_Contents.Profile_Content

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    profile_contents = Profile_Contents.list_profile_contents()
    render(conn, "index.json", profile_contents: profile_contents)
  end

  def create(conn, %{"profile__content" => profile__content_params}) do
    with {:ok, %Profile_Content{} = profile__content} <- Profile_Contents.create_profile__content(profile__content_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", profile__content_path(conn, :show, profile__content))
      |> render("show.json", profile__content: profile__content)
    end
  end

  def show(conn, %{"id" => id}) do
    profile__content = Profile_Contents.get_profile__content!(id)
    render(conn, "show.json", profile__content: profile__content)
  end

  def update(conn, %{"id" => id, "profile__content" => profile__content_params}) do
    profile__content = Profile_Contents.get_profile__content!(id)

    with {:ok, %Profile_Content{} = profile__content} <- Profile_Contents.update_profile__content(profile__content, profile__content_params) do
      render(conn, "show.json", profile__content: profile__content)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile__content = Profile_Contents.get_profile__content!(id)
    with {:ok, %Profile_Content{}} <- Profile_Contents.delete_profile__content(profile__content) do
      send_resp(conn, :no_content, "")
    end
  end
end
