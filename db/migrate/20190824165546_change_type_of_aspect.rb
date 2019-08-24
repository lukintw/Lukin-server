class ChangeTypeOfAspect < ActiveRecord::Migration[6.0]
  def change
    change_column :player_grades, :aspect, :string
  end
end
