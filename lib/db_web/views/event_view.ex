defmodule DbWeb.EventView do
  use DbWeb, :view
  alias DbWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      category: event.category,
      created_at: event.created_at,
      description: event.description,
      start_time: event.start_time,
      end_time: event.end_time,
      title: event.title,
      title_full: event.title_full}
  end
end
