class AddImageUrlToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :image_url, :string
  end
end
