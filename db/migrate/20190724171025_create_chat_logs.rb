class CreateChatLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_logs do |t|
      t.integer :chat_box_id
      t.string :content
      t.integer :speaker_id

      t.timestamps
    end
  end
end
