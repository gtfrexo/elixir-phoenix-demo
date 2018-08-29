defmodule DbWeb.Context_ValView do
  use DbWeb, :view
  alias DbWeb.Context_ValView

  def render("index.json", %{context_vals: context_vals}) do
    %{data: render_many(context_vals, Context_ValView, "context__val.json")}
  end

  def render("show.json", %{context__val: context__val}) do
    %{data: render_one(context__val, Context_ValView, "context__val.json")}
  end

  def render("context__val.json", %{context__val: context__val}) do
    %{id: context__val.id,
      animal_blurb: context__val.animal_blurb,
      boat_blurb: context__val.boat_blurb,
      education_blurb: context__val.education_blurb,
      eggs_blurb: context__val.eggs_blurb,
      emoji_blurb: context__val.emoji_blurb,
      occupation_blurb: context__val.occupation_blurb,
      worst_pickup_blurb: context__val.worst_pickup_blurb}
  end
end
