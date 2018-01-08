require_relative 'IPproxy'
require_relative 'MathProxy'
require_relative 'FactProxy'

class DecoratorPattern
	def initialize
		@obj = FactProxy.new(MathProxy.new(IPproxy.new()))
	end

	def print_data_to_screen
		data = @obj.parseJson
		puts data
	end
end