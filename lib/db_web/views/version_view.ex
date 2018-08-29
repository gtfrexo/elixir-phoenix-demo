defmodule DbWeb.VersionView do
  use DbWeb, :view
  alias DbWeb.VersionView

  def render("index.json", %{versions: versions}) do
    %{data: render_many(versions, VersionView, "version.json")}
  end

  def render("show.json", %{version: version}) do
    %{data: render_one(version, VersionView, "version.json")}
  end

  def render("version.json", %{version: version}) do
    %{id: version.id,
      current_version: version.current_version,
      target_version: version.target_version}
  end
end
