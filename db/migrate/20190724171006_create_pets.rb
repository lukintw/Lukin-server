class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.integer :player_id
      t.boolean :is_used
      t.integer :lv
      t.string :equipment
      t.float :experience
      t.datetime :go_time
      t.datetime :back_time

      t.timestamps
    end
  end
end
