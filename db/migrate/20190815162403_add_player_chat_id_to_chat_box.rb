class AddPlayerChatIdToChatBox < ActiveRecord::Migration[6.0]
  def change
    add_column :chat_boxes, :player_chat_id, :integer
  end
end
