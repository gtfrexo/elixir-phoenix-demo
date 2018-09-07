defmodule DbWeb.TestView do
  use DbWeb, :view
  alias DbWeb.TestView

  def render("index.json", %{tests: tests}) do
    %{data: render_many(tests, TestView, "test.json")}
  end

  def render("show.json", %{test: test}) do
    %{data: render_one(test, TestView, "test.json")}
  end

  def render("test.json", %{test: test}) do
    %{id: test.id,
      testing: test.testing,
      gender_id: test.gender_id}
  end
end
