class Customer < ActiveRecord::Base

	has_many :orders

	validates_presence_of :name
	validates_presence_of :phone
	validates_presence_of :email, uniqueness: true
	validates_presence_of :address1
	validates_presence_of :city
	validates_presence_of :state
	validates_presence_of :zip
	
end
