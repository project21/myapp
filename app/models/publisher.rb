
class Publisher < User
include Utility::Car
has_many :products #,:foreign_key=>"publisher_id"
has_many :subs , :class_name=>"Category",:foreign_key=>"sub_id"

scope :my_all , lambda {|publisher| {:conditions=>["email= ?",publisher]}}
scope :current_publisher, lambda {{:conditions=>["type=:type  AND created_at>=:time",{:type=>"Publisher", :time=>Time.now}]}}

end