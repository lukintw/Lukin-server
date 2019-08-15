class ChatBox < ApplicationRecord
    belongs_to :player_chat
    has_many :chat_logs
end
