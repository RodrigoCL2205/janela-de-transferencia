class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :position, inclusion: ['Goleiro', 'Lateral esquerdo', 'Lateral direito', 'Zagueiro', 'Volante', 'Meia', 'Atacante']
  validates :price, presence: true, numericality: { greather_than: 0}
  validates :age, presence: true, numericality: { greather_than: 0}
  has_one_attached :photo
end
