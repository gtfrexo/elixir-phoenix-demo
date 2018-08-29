defmodule DbWeb.GenderView do
  use DbWeb, :view
  alias DbWeb.GenderView

  def render("index.json", %{genders: genders}) do
    %{data: render_many(genders, GenderView, "gender.json")}
  end

  def render("show.json", %{gender: gender}) do
    %{data: render_one(gender, GenderView, "gender.json")}
  end

  def render("gender.json", %{gender: gender}) do
    %{id: gender.id,
      is_male: gender.is_male,
      is_female: gender.is_female}
  end
end
