defmodule Db.GendersTest do
  use Db.DataCase

  alias Db.Genders

  describe "genders" do
    alias Db.Genders.Gender

    @valid_attrs %{is_female: true, is_male: true}
    @update_attrs %{is_female: false, is_male: false}
    @invalid_attrs %{is_female: nil, is_male: nil}

    def gender_fixture(attrs \\ %{}) do
      {:ok, gender} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Genders.create_gender()

      gender
    end

    test "list_genders/0 returns all genders" do
      gender = gender_fixture()
      assert Genders.list_genders() == [gender]
    end

    test "get_gender!/1 returns the gender with given id" do
      gender = gender_fixture()
      assert Genders.get_gender!(gender.id) == gender
    end

    test "create_gender/1 with valid data creates a gender" do
      assert {:ok, %Gender{} = gender} = Genders.create_gender(@valid_attrs)
      assert gender.is_female == true
      assert gender.is_male == true
    end

    test "create_gender/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genders.create_gender(@invalid_attrs)
    end

    test "update_gender/2 with valid data updates the gender" do
      gender = gender_fixture()
      assert {:ok, gender} = Genders.update_gender(gender, @update_attrs)
      assert %Gender{} = gender
      assert gender.is_female == false
      assert gender.is_male == false
    end

    test "update_gender/2 with invalid data returns error changeset" do
      gender = gender_fixture()
      assert {:error, %Ecto.Changeset{}} = Genders.update_gender(gender, @invalid_attrs)
      assert gender == Genders.get_gender!(gender.id)
    end

    test "delete_gender/1 deletes the gender" do
      gender = gender_fixture()
      assert {:ok, %Gender{}} = Genders.delete_gender(gender)
      assert_raise Ecto.NoResultsError, fn -> Genders.get_gender!(gender.id) end
    end

    test "change_gender/1 returns a gender changeset" do
      gender = gender_fixture()
      assert %Ecto.Changeset{} = Genders.change_gender(gender)
    end
  end
end
