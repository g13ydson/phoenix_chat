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

  def get_sender_messages(sender_id) do
    query =
      from m in Message,
        where: m.sender_id == ^sender_id,
        order_by: [desc: m.inserted_at],
        preload: [:sender]

    Repo.all(query)
  end

  def get_recipient_messages(recipient_id) do
    query =
      from m in Message,
        where: m.recipient_id == ^recipient_id,
        order_by: [desc: m.inserted_at],
        preload: [:recipient]

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
