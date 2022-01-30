class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true

  validates :name, presence: true
  validates :introduction, length: { maximum: 200 }

  has_one_attached :img

  has_many :reservations
  has_many :rooms

end
