defmodule Db.Media_Resolver do

    alias Db.Medias

    def all(_args, _info) do
        {:ok, Medias.list_medias}
    end

    def find(%{id: id}, _info) do
        case Medias.get_media!(id) do
            nil -> {:error, "Media with id #{id} not found."}
            media -> {:ok, media}
        end
    end

    def create(args, _info) do
        Medias.create_media(args)
    end

    def update(%{id: id, media: media_params}, _info) do
        Medias.get_media!(id)
        |> Medias.update_media(media_params)
    end

    def delete(%{id: id}, _info) do
        Medias.get_media!(id)
        |> Medias.delete_media
    end

end