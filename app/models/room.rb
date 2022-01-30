class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user

  has_one_attached :img

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true


  def self.search(search)
    if search
      Room.where(['name LIKE ? OR address LIKE ? OR description LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%"])
		else
		  Room.all
		end
	end
end

