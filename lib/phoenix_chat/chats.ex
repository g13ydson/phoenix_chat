defmodule PhoenixChat.Chats do
  @moduledoc """
  The Chats context.
  """

  import Ecto.Query, warn: false
  alias PhoenixChat.Repo

  alias PhoenixChat.Chats.Message

  def list_messages do
    Repo.all(Message)
  end

  def get_message!(id), do: Repo.get!(Message, id)

  def get_sender_messages(sender_nickname) do
    query =
      from m in Message,
        where: m.sender_nickname == ^sender_nickname,
        order_by: [desc: m.inserted_at],
        select: %{sender_nickname: m.sender_nickname, body: m.body}

    Repo.all(query)
  end

  def get_recipient_messages(recipient_nickname) do
    query =
      from m in Message,
        where: m.recipient_nickname == ^recipient_nickname,
        order_by: [desc: m.inserted_at],
        select: %{sender_nickname: m.sender_nickname, body: m.body}

    Repo.all(query)
  end

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def change_message(%Message{} = message) do
    Message.changeset(message, %{})
  end
end
