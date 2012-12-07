class Category < ActiveRecord::Base
	include ::Service
    acts_as_tree :order => "name"
    attr_accessible :type, :value,:sub_id,:name,:parent_id
    has_many :products


end
