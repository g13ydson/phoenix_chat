defmodule PhoenixChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nickname, :string

    has_many :received_messages, PhoenixChat.Chats.Message, foreign_key: :recipient_id
    has_many :sent_messages, PhoenixChat.Chats.Message, foreign_key: :sender_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
  end
end
