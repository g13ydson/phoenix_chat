defmodule PhoenixChat.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string

    belongs_to :recipient, PhoenixChat.Accounts.User
    belongs_to :sender, PhoenixChat.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:body, :sender_id, :recipient_id])
    |> validate_required([:body, :sender_id, :recipient_id])
    |> foreign_key_constraint(:sender_id)
    |> foreign_key_constraint(:recipient_id)
  end
end
