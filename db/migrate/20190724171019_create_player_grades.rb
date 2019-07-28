class CreatePlayerGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :player_grades do |t|
      t.integer :player_id
      t.integer :aspect
      t.integer :grade

      t.timestamps
    end
  end
end
