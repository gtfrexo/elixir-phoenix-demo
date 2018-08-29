defmodule DbWeb.PoolView do
  use DbWeb, :view
  alias DbWeb.PoolView

  def render("index.json", %{pools: pools}) do
    %{data: render_many(pools, PoolView, "pool.json")}
  end

  def render("show.json", %{pool: pool}) do
    %{data: render_one(pool, PoolView, "pool.json")}
  end

  def render("pool.json", %{pool: pool}) do
    %{id: pool.id,
      eventbrite_id: pool.eventbrite_id,
      seatgeek_id: pool.seatgeek_id}
  end
end
