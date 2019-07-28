class CreateMatchValues < ActiveRecord::Migration[6.0]
  def change
    create_table :match_values do |t|
      t.integer :player_id
      t.integer :friend_id
      t.float :grade

      t.timestamps
    end
  end
end
