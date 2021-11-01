class ChangeAgePlayers < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :age, :integer
  end
end
