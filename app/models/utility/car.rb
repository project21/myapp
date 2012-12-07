module Utility


 module Car


    def self.included(base)
      base.send :extend, Chevy
      base.send :include, Bicycle
    end

 	module Chevy
	def hello_chevy
		puts "hi chevy"
	end
    end


 module Bicycle
 	def hello_bicycle
 		puts "hi bicycle"
 	end
 end

end
end