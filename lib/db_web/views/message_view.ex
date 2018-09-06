defmodule DbWeb.MessageView do
  use DbWeb, :view
  alias DbWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      content: message.content,
      read_at: message.read_at,
      sent_at: message.sent_at}
  end
end
