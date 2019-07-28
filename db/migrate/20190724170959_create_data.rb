class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.integer :player_id
      t.integer :current_hp
      t.integer :point
      t.integer :current_pet
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
