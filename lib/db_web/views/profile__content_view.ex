defmodule DbWeb.Profile_ContentView do
  use DbWeb, :view
  alias DbWeb.Profile_ContentView

  def render("index.json", %{profile_contents: profile_contents}) do
    %{data: render_many(profile_contents, Profile_ContentView, "profile__content.json")}
  end

  def render("show.json", %{profile__content: profile__content}) do
    %{data: render_one(profile__content, Profile_ContentView, "profile__content.json")}
  end

  def render("profile__content.json", %{profile__content: profile__content}) do
    %{id: profile__content.id,
      animal_blurb: profile__content.animal_blurb,
      boat_blurb: profile__content.boat_blurb,
      education_blurb: profile__content.education_blurb,
      eggs_blurb: profile__content.eggs_blurb,
      emoji_blurb: profile__content.emoji_blurb,
      occupation_blurb: profile__content.occupation_blurb,
      worst_pickup_blurb: profile__content.worst_pickup_blurb}
  end
end
