defmodule Db.Context_ValsTest do
  use Db.DataCase

  alias Db.Context_Vals

  describe "context_vals" do
    alias Db.Context_Vals.Context_Val

    @valid_attrs %{animal_blurb: "some animal_blurb", boat_blurb: "some boat_blurb", education_blurb: "some education_blurb", eggs_blurb: "some eggs_blurb", emoji_blurb: "some emoji_blurb", occupation_blurb: "some occupation_blurb", worst_pickup_blurb: "some worst_pickup_blurb"}
    @update_attrs %{animal_blurb: "some updated animal_blurb", boat_blurb: "some updated boat_blurb", education_blurb: "some updated education_blurb", eggs_blurb: "some updated eggs_blurb", emoji_blurb: "some updated emoji_blurb", occupation_blurb: "some updated occupation_blurb", worst_pickup_blurb: "some updated worst_pickup_blurb"}
    @invalid_attrs %{animal_blurb: nil, boat_blurb: nil, education_blurb: nil, eggs_blurb: nil, emoji_blurb: nil, occupation_blurb: nil, worst_pickup_blurb: nil}

    def context__val_fixture(attrs \\ %{}) do
      {:ok, context__val} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Context_Vals.create_context__val()

      context__val
    end

    test "list_context_vals/0 returns all context_vals" do
      context__val = context__val_fixture()
      assert Context_Vals.list_context_vals() == [context__val]
    end

    test "get_context__val!/1 returns the context__val with given id" do
      context__val = context__val_fixture()
      assert Context_Vals.get_context__val!(context__val.id) == context__val
    end

    test "create_context__val/1 with valid data creates a context__val" do
      assert {:ok, %Context_Val{} = context__val} = Context_Vals.create_context__val(@valid_attrs)
      assert context__val.animal_blurb == "some animal_blurb"
      assert context__val.boat_blurb == "some boat_blurb"
      assert context__val.education_blurb == "some education_blurb"
      assert context__val.eggs_blurb == "some eggs_blurb"
      assert context__val.emoji_blurb == "some emoji_blurb"
      assert context__val.occupation_blurb == "some occupation_blurb"
      assert context__val.worst_pickup_blurb == "some worst_pickup_blurb"
    end

    test "create_context__val/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Context_Vals.create_context__val(@invalid_attrs)
    end

    test "update_context__val/2 with valid data updates the context__val" do
      context__val = context__val_fixture()
      assert {:ok, context__val} = Context_Vals.update_context__val(context__val, @update_attrs)
      assert %Context_Val{} = context__val
      assert context__val.animal_blurb == "some updated animal_blurb"
      assert context__val.boat_blurb == "some updated boat_blurb"
      assert context__val.education_blurb == "some updated education_blurb"
      assert context__val.eggs_blurb == "some updated eggs_blurb"
      assert context__val.emoji_blurb == "some updated emoji_blurb"
      assert context__val.occupation_blurb == "some updated occupation_blurb"
      assert context__val.worst_pickup_blurb == "some updated worst_pickup_blurb"
    end

    test "update_context__val/2 with invalid data returns error changeset" do
      context__val = context__val_fixture()
      assert {:error, %Ecto.Changeset{}} = Context_Vals.update_context__val(context__val, @invalid_attrs)
      assert context__val == Context_Vals.get_context__val!(context__val.id)
    end

    test "delete_context__val/1 deletes the context__val" do
      context__val = context__val_fixture()
      assert {:ok, %Context_Val{}} = Context_Vals.delete_context__val(context__val)
      assert_raise Ecto.NoResultsError, fn -> Context_Vals.get_context__val!(context__val.id) end
    end

    test "change_context__val/1 returns a context__val changeset" do
      context__val = context__val_fixture()
      assert %Ecto.Changeset{} = Context_Vals.change_context__val(context__val)
    end
  end
end
