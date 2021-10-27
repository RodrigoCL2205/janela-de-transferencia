class Player < ApplicationRecord
  validate :name, presence: true, uniqueness: true
  validate :position, presence: true
  validate :position, inclusion: ['goleiro', 'lateral esquerdo', 'lateral direito', 'zagueiro', 'volante', 'meia', 'atacante']
  validate :price, presence: true, numericality: { greather_than: 0}
  validate :age, presence: true, numericality: { greather_than: 0}
end
