# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixChat.Repo.insert!(%PhoenixChat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixChat.Repo
alias PhoenixChat.Chats.Message

Repo.insert!(%Message{sender_nickname: "@gleydson", recipient_nickname: "@emilia", body: "Hello!"})

Repo.insert!(%Message{sender_nickname: "@emilia", recipient_nickname: "@gleydson", body: "Hi!"})
