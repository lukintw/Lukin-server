class CreatePlayerChats < ActiveRecord::Migration[6.0]
  def change
    create_table :player_chats do |t|
      t.integer :player_id
      t.integer :friend_id
      t.integer :match_value
      t.integer :chat_box_id

      t.timestamps
    end
  end
end
