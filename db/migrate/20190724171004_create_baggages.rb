class CreateBaggages < ActiveRecord::Migration[6.0]
  def change
    create_table :baggages do |t|
      t.integer :player_id

      t.timestamps
    end
  end
end
