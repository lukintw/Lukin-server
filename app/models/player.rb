class Player < ApplicationRecord
  has_many :datum
  has_many :pets
  has_many :match_values
  has_many :chat_logs, foreign_key: 'speaker_id'
end
