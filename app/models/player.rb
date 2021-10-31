class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :position, inclusion: ['Goleiro', 'Líbero', 'Lateral Esq.', 'Lateral Dir.',
                                   'Zagueiro', 'Volante', 'Meia Central', 'Meia Ofensivo', 'Meia Direita',
                                   'Meia Esquerda', 'Ponta Direita', 'Ponta Esquerda', 'Atacante', 'Centroavante']
  validates :price, presence: true, numericality: { greather_than: 0}
  validates :age, presence: true, numericality: { greather_than: 0}

  has_one_attached :photo
end
