class CreateGameDataHps < ActiveRecord::Migration[6.0]
  def change
    create_table :game_data_hps do |t|
      t.integer :level
      t.integer :max_hp

      t.timestamps
    end
  end
end
