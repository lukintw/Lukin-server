class CreateBuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :buffs do |t|
      t.integer :player_id
      t.integer :add_hello_count
      t.integer :add_friend_count

      t.timestamps
    end
  end
end
