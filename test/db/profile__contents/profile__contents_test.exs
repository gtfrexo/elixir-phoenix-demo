defmodule Db.Profile_ContentsTest do
  use Db.DataCase

  alias Db.Profile_Contents

  describe "profile_contents" do
    alias Db.Profile_Contents.Profile_Content

    @valid_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", emoji_blurb: "some emoji_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some worst_pickup_blurb"}
    @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", emoji_blurb: "some updated emoji_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated worst_pickup_blurb"}
    @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, emoji_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil}

    def profile__content_fixture(attrs \\ %{}) do
      {:ok, profile__content} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile_Contents.create_profile__content()

      profile__content
    end

    test "list_profile_contents/0 returns all profile_contents" do
      profile__content = profile__content_fixture()
      assert Profile_Contents.list_profile_contents() == [profile__content]
    end

    test "get_profile__content!/1 returns the profile__content with given id" do
      profile__content = profile__content_fixture()
      assert Profile_Contents.get_profile__content!(profile__content.id) == profile__content
    end

    test "create_profile__content/1 with valid data creates a profile__content" do
      assert {:ok, %Profile_Content{} = profile__content} = Profile_Contents.create_profile__content(@valid_attrs)
      assert profile__content.animal_blurb == "some animal_blurb"
      assert profile__content.boat_blurb == "some boat_blurb"
      assert profile__content.education_blurb == "some education_blurb"
      assert profile__content.eggs_blurb == "some eggs_blurb"
      assert profile__content.emoji_blurb == "some emoji_blurb"
      assert profile__content.occupation_blurb == "some occupation_blurb"
      assert profile__content.worst_pickup_blurb == "some worst_pickup_blurb"
    end

    test "create_profile__content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile_Contents.create_profile__content(@invalid_attrs)
    end

    test "update_profile__content/2 with valid data updates the profile__content" do
      profile__content = profile__content_fixture()
      assert {:ok, profile__content} = Profile_Contents.update_profile__content(profile__content, @update_attrs)
      assert %Profile_Content{} = profile__content
      assert profile__content.animal_blurb == "some updated animal_blurb"
      assert profile__content.boat_blurb == "some updated boat_blurb"
      assert profile__content.education_blurb == "some updated education_blurb"
      assert profile__content.eggs_blurb == "some updated eggs_blurb"
      assert profile__content.emoji_blurb == "some updated emoji_blurb"
      assert profile__content.occupation_blurb == "some updated occupation_blurb"
      assert profile__content.worst_pickup_blurb == "some updated worst_pickup_blurb"
    end

    test "update_profile__content/2 with invalid data returns error changeset" do
      profile__content = profile__content_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile_Contents.update_profile__content(profile__content, @invalid_attrs)
      assert profile__content == Profile_Contents.get_profile__content!(profile__content.id)
    end

    test "delete_profile__content/1 deletes the profile__content" do
      profile__content = profile__content_fixture()
      assert {:ok, %Profile_Content{}} = Profile_Contents.delete_profile__content(profile__content)
      assert_raise Ecto.NoResultsError, fn -> Profile_Contents.get_profile__content!(profile__content.id) end
    end

    test "change_profile__content/1 returns a profile__content changeset" do
      profile__content = profile__content_fixture()
      assert %Ecto.Changeset{} = Profile_Contents.change_profile__content(profile__content)
    end
  end
end
