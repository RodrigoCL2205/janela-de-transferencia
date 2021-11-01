class ChangePricePlayers < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :price, :integer
  end
end
