class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :position, inclusion: ['goleiro', 'lateral esquerdo', 'lateral direito', 'zagueiro', 'volante', 'meia', 'atacante']
  validates :price, presence: true, numericality: { greather_than: 0}
  validates :age, presence: true, numericality: { greather_than: 0}
end
