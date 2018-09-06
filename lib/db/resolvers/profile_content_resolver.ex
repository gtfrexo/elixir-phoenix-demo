defmodule Db.Profile_Content_Resolver do

    alias Db.Profile_Contents

    def all(_args, _info) do
        {:ok, Profile_Contents.list_profile_contents}
    end

    def find(%{id: id}, _info) do
        case Profile_Contents.get_profile__content!(id) do
            nil -> {:error, "Profile_Content with id #{id} not found."}
            profile_content -> {:ok, profile_content}
        end
    end

    def create(args, _info) do
        Profile_Contents.create_profile__content(args)
    end

    def update(%{id: id, profile_content: profile_content_params}, _info) do
        Profile_Contents.get_profile__content!(id)
        |> Profile_Contents.update_profile__content(profile_content_params)
    end

    def delete(%{id: id}, _info) do
        Profile_Contents.get_profile__content!(id)
        |> Profile_Contents.delete_profile__content
    end

end