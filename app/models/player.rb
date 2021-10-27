class Player < ApplicationRecord
<<<<<<< HEAD
=======
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :position, inclusion: ['Goleiro', 'Lateral esquerdo', 'Lateral direito', 'Zagueiro', 'Volante', 'Meia', 'Atacante']
  validates :price, presence: true, numericality: { greather_than: 0}
  validates :age, presence: true, numericality: { greather_than: 0}
>>>>>>> fe84aa5de5b28dab063eebb85f679e3acb981b4a
end
