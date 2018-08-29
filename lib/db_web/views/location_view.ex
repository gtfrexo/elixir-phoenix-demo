defmodule DbWeb.LocationView do
  use DbWeb, :view
  alias DbWeb.LocationView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      address: location.address,
      address_full: location.address_full,
      city: location.city,
      country: location.country,
      lat: location.lat,
      lon: location.lon,
      state: location.state,
      zip: location.zip}
  end
end
