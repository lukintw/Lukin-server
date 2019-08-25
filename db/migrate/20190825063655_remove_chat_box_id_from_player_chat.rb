class RemoveChatBoxIdFromPlayerChat < ActiveRecord::Migration[6.0]
  def change
    remove_column :chat_boxes, :player_chat_id
  end
end
