defmodule DbWeb.VersionController do
  use DbWeb, :controller

  alias Db.Versions
  alias Db.Versions.Version

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    versions = Versions.list_versions()
    render(conn, "index.json", versions: versions)
  end

  def create(conn, %{"version" => version_params}) do
    with {:ok, %Version{} = version} <- Versions.create_version(version_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", version_path(conn, :show, version))
      |> render("show.json", version: version)
    end
  end

  def show(conn, %{"id" => id}) do
    version = Versions.get_version!(id)
    render(conn, "show.json", version: version)
  end

  def update(conn, %{"id" => id, "version" => version_params}) do
    version = Versions.get_version!(id)

    with {:ok, %Version{} = version} <- Versions.update_version(version, version_params) do
      render(conn, "show.json", version: version)
    end
  end

  def delete(conn, %{"id" => id}) do
    version = Versions.get_version!(id)
    with {:ok, %Version{}} <- Versions.delete_version(version) do
      send_resp(conn, :no_content, "")
    end
  end
end
