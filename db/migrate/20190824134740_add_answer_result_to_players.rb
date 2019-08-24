class AddAnswerResultToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :answer_result, :string
  end
end
