module Service
	CATEGORIES= %W{electronics furniture clothing}

	SUB_CATEGORIES = {:electronics=>["computer", "tvs", "accesories"],
	                 :furniture=>["table", "couches","cabnet"],
	                 :clothing=>["shirts","jeans","pants"]
                      }.with_indifferent_access
	def hello
		puts "hi service"
	end
	
end