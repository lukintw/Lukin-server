class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :gender
      t.datetime :birth
      t.integer :height
      t.integer :education
      t.integer :personality
      t.string :image

      t.timestamps
    end
  end
end
