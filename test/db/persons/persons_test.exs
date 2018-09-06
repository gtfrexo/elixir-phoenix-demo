defmodule Db.PersonsTest do
  use Db.DataCase

  alias Db.Persons

  describe "persons" do
    alias Db.Persons.Person

    @valid_attrs %{auth0_me_id: "some auth0_me_id", auth_token: "some auth_token", bio: "some bio", birthday: "2010-04-17 14:00:00.000000Z", email: "some email", email_verified: true, id_token: "some id_token", name: "some name", name_full: "some name_full", target_gender: "some target_gender", target_relationship: "some target_relationship", token: "some token"}
    @update_attrs %{auth0_me_id: "some updated auth0_me_id", auth_token: "some updated auth_token", bio: "some updated bio", birthday: "2011-05-18 15:01:01.000000Z", email: "some updated email", email_verified: false, id_token: "some updated id_token", name: "some updated name", name_full: "some updated name_full", target_gender: "some updated target_gender", target_relationship: "some updated target_relationship", token: "some updated token"}
    @invalid_attrs %{auth0_me_id: nil, auth_token: nil, bio: nil, birthday: nil, email: nil, email_verified: nil, id_token: nil, name: nil, name_full: nil, target_gender: nil, target_relationship: nil, token: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Persons.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Persons.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Persons.create_person(@valid_attrs)
      assert person.auth0_me_id == "some auth0_me_id"
      assert person.auth_token == "some auth_token"
      assert person.bio == "some bio"
      assert person.birthday == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert person.email == "some email"
      assert person.email_verified == true
      assert person.id_token == "some id_token"
      assert person.name == "some name"
      assert person.name_full == "some name_full"
      assert person.target_gender == "some target_gender"
      assert person.target_relationship == "some target_relationship"
      assert person.token == "some token"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Persons.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.auth0_me_id == "some updated auth0_me_id"
      assert person.auth_token == "some updated auth_token"
      assert person.bio == "some updated bio"
      assert person.birthday == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert person.email == "some updated email"
      assert person.email_verified == false
      assert person.id_token == "some updated id_token"
      assert person.name == "some updated name"
      assert person.name_full == "some updated name_full"
      assert person.target_gender == "some updated target_gender"
      assert person.target_relationship == "some updated target_relationship"
      assert person.token == "some updated token"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_person(person, @invalid_attrs)
      assert person == Persons.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Persons.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Persons.change_person(person)
    end
  end
end
