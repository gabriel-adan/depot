class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: {greater_than_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(jpg|png|gif)\Z}i,
		message: 'Debe ser una Url de imagen con terminacion JPG, PNG O GIF.'
	}
end
