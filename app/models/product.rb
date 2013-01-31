
	require "Module1/say"
  
class Product < ActiveRecord::Base
	include ::Service
	include Utility::Car
	include Module1::Say
  attr_accessible :details, :name,:publisher_id,:product_name
  validates_presence_of :product_name
  belongs_to :user
  belongs_to :category
  belongs_to :publisher #,:class_name=>"User",:foreign_key=>"publisher_id"
  scope :fresh , lambda { |product| {:conditions=>["created_at<:time AND id=:product", :time=>Time.now, :product=>product]}}
  scope :old ,:conditions=>["created_at>?",Time.now]
def meth1
	hello_chevy
end

def categories
	puts SUB_CATEGORIES[CATEGORIES[2]]
end

alias_method :my_new , :categories
end
