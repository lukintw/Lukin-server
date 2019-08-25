class ChatBox < ApplicationRecord
    has_many :player_chats
    has_many :chat_logs
end
