defmodule PhoenixChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :string
      add :sender_nickname, :string
      add :recipient_nickname, :string

      timestamps()
    end
  end
end
