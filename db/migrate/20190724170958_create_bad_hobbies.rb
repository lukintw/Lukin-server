class CreateBadHobbies < ActiveRecord::Migration[6.0]
  def change
    create_table :bad_hobbies do |t|
      t.integer :player_id
      t.integer :hobby

      t.timestamps
    end
  end
end
