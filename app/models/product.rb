class Product < ActiveRecord::Base

	#attr_accessible :photo
	has_attached_file :image, styles: { :medium => "300x300>", :thumb => "100x100>" }

	has_many :line_items
	has_many :product_categories, :dependent => :destroy
	has_many :categories, :through => :product_categories

	validates_presence_of :name
	validates_presence_of :unit_price
	validates_presence_of :quantity
	validates_presence_of :sku, uniqueness: true
	validates_presence_of :model_num, uniqueness: true

end
