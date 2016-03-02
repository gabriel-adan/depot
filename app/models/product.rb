class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: {greater_than_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(jpg|png|gif)\Z}i,
		message: 'Debe ser una Url de imagen con terminacion JPG, PNG O GIF.'
	}

	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	def self.latest
		Product.order(:updated_at).last
	end

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
