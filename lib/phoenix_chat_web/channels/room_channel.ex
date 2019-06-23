defmodule PhoenixChatWeb.RoomChannel do
  use PhoenixChatWeb, :channel

  alias PhoenixChat.Chats
  alias PhoenixChatWeb.Endpoint

  def join("room:" <> nickname, payload, socket) do
    send(self, {:after_join, payload})
    {:ok, assign(socket, :sender_nickname, nickname)}
  end

  def handle_info({:after_join, payload}, socket) do
    messages = Chats.get_recipient_messages(socket.assigns.sender_nickname)

    push(socket, "messages", %{messages: messages})
    {:noreply, socket}
  end

  def handle_in("new:message", payload, socket) do
    case Chats.create_message(%{
           sender_nickname: socket.assigns.sender_nickname,
           recipient_nickname: payload["recipient_nickname"],
           body: payload["body"]
         }) do
      {:ok, msg} ->
        Endpoint.broadcast("room:#{payload["recipient_nickname"]}", "messages", %{
          messages: [%{sender_nickname: socket.assigns.sender_nickname, body: payload["body"]}]
        })

        {:reply, :ok, socket}

      {:error, changeset} ->
        {:reply, {:error, %{reason: "errors"}}, socket}
    end
  end
end
