class Product < ActiveRecord::Base

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	has_many :line_items
	has_many :product_categories, :dependent => :destroy
	has_many :categories, :through => :product_categories

	validates_presence_of :name
	validates_presence_of :unit_price
	validates_presence_of :quantity
	validates_presence_of :sku, uniqueness: true
	validates_presence_of :model_num, uniqueness: true

end
