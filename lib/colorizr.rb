class String
	colors_hash = {black: 30, red: 31, green: 32, yellow:33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}

	def self.colors
		colors_hash = {black: 30, red: 31, green: 32, yellow:33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}
		colors_hash.keys
	end

	self.instance_eval do
		def sample_colors
			colors_hash = {black: 30, red: 31, green: 32, yellow:33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}
			colors_hash.each {|key,value| puts("This is \e[#{value}m#{key}\e[0m")}
		end
	end

	def self.create_colors
		colors_hash = {black: 30, red: 31, green: 32, yellow:33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}
		colors_hash.each { |key,value|
			define_method("#{key}") do
				puts "\e[#{value}m#{self}\e[0m"
			end
		}
	end

	create_colors
end