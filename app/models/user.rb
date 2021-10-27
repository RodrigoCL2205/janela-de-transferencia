class User < ApplicationRecord
  # root to: 'pages#home'
  has_many :deals
  has_many :players

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
