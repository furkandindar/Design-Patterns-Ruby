require_relative 'Response'

class Audience

	attr_reader :response_type

	def initialize
		@x = rand(1..99)

		if (@x%3) == 0
			@response_type = Supporter.new
			@response_type.respond
		elsif (@x%3) == 1
			@response_type = Neutral.new
			response_type.respond
		elsif (@x%3) == 2
			@response_type = Against.new
			response_type.respond
		end

	end

	def update(event_type)
		if event_type == 'win'
			puts @response_type.win
		elsif event_type == 'lost'
			puts @response_type.lost
		elsif event_type == 'harmed'
			puts @response_type.harmed
		end
	end
end