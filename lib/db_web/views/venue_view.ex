defmodule DbWeb.VenueView do
  use DbWeb, :view
  alias DbWeb.VenueView

  def render("index.json", %{venues: venues}) do
    %{data: render_many(venues, VenueView, "venue.json")}
  end

  def render("show.json", %{venue: venue}) do
    %{data: render_one(venue, VenueView, "venue.json")}
  end

  def render("venue.json", %{venue: venue}) do
    %{id: venue.id,
      category: venue.category,
      description: venue.description,
      name: venue.name,
      name_full: venue.name_full}
  end
end
