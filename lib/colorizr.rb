class String
	#Class variable containing the colors and codes
	@@colors_hash = {black: 30, red: 31, green: 32, yellow:33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}
	# Define the class method to display the list of colors
	def self.colors
		@@colors_hash.keys
	end
	# Define the class method for the sample colors
	def self.sample_colors
		@@colors_hash.each {|key,value| puts "This is #{key.to_s.send key}"}
	end
	# Define the instace method for the colors
	def self.create_colors
		@@colors_hash.each { |key,value|
			define_method("#{key}") do
				"\e[#{value}m#{self}\e[0m"
			end
		}
	end
	# Create the instance methods for the colors
	create_colors
end