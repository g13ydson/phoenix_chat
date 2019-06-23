defmodule PhoenixChat.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :sender_nickname, :string
    field :recipient_nickname, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:body, :sender_nickname, :recipient_nickname])
    |> validate_required([:body, :sender_nickname, :recipient_nickname])
  end
end
