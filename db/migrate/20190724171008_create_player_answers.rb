class CreatePlayerAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :player_answers do |t|
      t.integer :player_id
      t.integer :quiz
      t.integer :answer

      t.timestamps
    end
  end
end
