class Player < ApplicationRecord
  has_many :deals
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :position, inclusion: ['Goleiro', 'Líbero', 'Lateral Esq.', 'Lateral Dir.',
                                   'Zagueiro', 'Volante', 'Meia Central', 'Meia Ofensivo', 'Meia Direita',
                                   'Meia Esquerda', 'Ponta Direita', 'Ponta Esquerda', 'Atacante', 'Centroavante']
  validates :price, presence: true, numericality: { greather_than: 0}
  validates :age, presence: true, numericality: { greather_than: 0}

  has_one_attached :photo

  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_name_and_position_order_by_price,
    against: [ :name, :position ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    },
     order_within_rank: "players.price DESC"
end
