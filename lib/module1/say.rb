module Module1
	
module Say
def self.included(base)
      base.extend(Hey)
    end
module Hey
def say
puts "hello"
end
end

end
end