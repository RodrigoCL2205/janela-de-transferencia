class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.decimal :price
      t.decimal :rating

      t.timestamps
    end
  end
end
