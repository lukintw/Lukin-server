class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :player_id
      t.integer :interest

      t.timestamps
    end
  end
end
