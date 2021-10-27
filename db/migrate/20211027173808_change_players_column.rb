class ChangePlayersColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :rating, :age
  end
end
