defmodule DbWeb.HostView do
  use DbWeb, :view
  alias DbWeb.HostView

  def render("index.json", %{hosts: hosts}) do
    %{data: render_many(hosts, HostView, "host.json")}
  end

  def render("show.json", %{host: host}) do
    %{data: render_one(host, HostView, "host.json")}
  end

  def render("host.json", %{host: host}) do
    %{id: host.id,
      description: host.description,
      name: host.name,
      name_full: host.name_full,
      venue_id: host.venue_id}
  end
end
