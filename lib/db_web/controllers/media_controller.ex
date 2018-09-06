defmodule DbWeb.MediaController do
  use DbWeb, :controller

  alias Db.Medias
  alias Db.Medias.Media

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    medias = Medias.list_medias()
    render(conn, "index.json", medias: medias)
  end

  def create(conn, %{"media" => media_params}) do
    with {:ok, %Media{} = media} <- Medias.create_media(media_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", media_path(conn, :show, media))
      |> render("show.json", media: media)
    end
  end

  def show(conn, %{"id" => id}) do
    media = Medias.get_media!(id)
    render(conn, "show.json", media: media)
  end

  def update(conn, %{"id" => id, "media" => media_params}) do
    media = Medias.get_media!(id)

    with {:ok, %Media{} = media} <- Medias.update_media(media, media_params) do
      render(conn, "show.json", media: media)
    end
  end

  def delete(conn, %{"id" => id}) do
    media = Medias.get_media!(id)
    with {:ok, %Media{}} <- Medias.delete_media(media) do
      send_resp(conn, :no_content, "")
    end
  end
end
