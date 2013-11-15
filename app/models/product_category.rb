class ProductCategory < ActiveRecord::Base

	belongs_to :product
	belongs_to :category

	validates_presence_of :product_id, :category_id
	validates_uniqueness_of :product_id, :scope => :category_id

end
