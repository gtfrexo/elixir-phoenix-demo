defmodule DbWeb.Context_ValController do
  use DbWeb, :controller

  alias Db.Context_Vals
  alias Db.Context_Vals.Context_Val

  action_fallback DbWeb.FallbackController

  def index(conn, _params) do
    context_vals = Context_Vals.list_context_vals()
    render(conn, "index.json", context_vals: context_vals)
  end

  def create(conn, %{"context__val" => context__val_params}) do
    with {:ok, %Context_Val{} = context__val} <- Context_Vals.create_context__val(context__val_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", context__val_path(conn, :show, context__val))
      |> render("show.json", context__val: context__val)
    end
  end

  def show(conn, %{"id" => id}) do
    context__val = Context_Vals.get_context__val!(id)
    render(conn, "show.json", context__val: context__val)
  end

  def update(conn, %{"id" => id, "context__val" => context__val_params}) do
    context__val = Context_Vals.get_context__val!(id)

    with {:ok, %Context_Val{} = context__val} <- Context_Vals.update_context__val(context__val, context__val_params) do
      render(conn, "show.json", context__val: context__val)
    end
  end

  def delete(conn, %{"id" => id}) do
    context__val = Context_Vals.get_context__val!(id)
    with {:ok, %Context_Val{}} <- Context_Vals.delete_context__val(context__val) do
      send_resp(conn, :no_content, "")
    end
  end
end
