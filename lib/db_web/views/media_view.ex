defmodule DbWeb.MediaView do
  use DbWeb, :view
  alias DbWeb.MediaView

  def render("index.json", %{medias: medias}) do
    %{data: render_many(medias, MediaView, "media.json")}
  end

  def render("show.json", %{media: media}) do
    %{data: render_one(media, MediaView, "media.json")}
  end

  def render("media.json", %{media: media}) do
    %{id: media.id,
      created_at: media.created_at,
      deleted_at: media.deleted_at,
      description: media.description,
      media_type: media.media_type,
      url: media.url}
  end
end
