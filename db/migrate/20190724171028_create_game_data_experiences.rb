class CreateGameDataExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :game_data_experiences do |t|
      t.integer :level
      t.integer :max_experience

      t.timestamps
    end
  end
end
