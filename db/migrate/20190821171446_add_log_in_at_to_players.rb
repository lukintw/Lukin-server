class AddLogInAtToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :log_in_at, :datetime
  end
end
