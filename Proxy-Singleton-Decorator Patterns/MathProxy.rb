require_relative 'ApiProxy'
require_relative 'Log'
require 'open-uri'

class MathProxy < ApiProxy
	def initialize(object)
		@ip_changed = object.parseJson
	end

	def open_connection
		@base_uri = 'https://newton.now.sh/simplify/' + @ip_changed
		begin
			@simplified= open(@base_uri)
			@body = @simplified.read
			@data_hash = JSON.parse(@body)
		rescue
			fallback
		end
	end

	def parseJson
		obj = open_connection
		result = obj["result"]
		#puts "your ip's sum is : #{result}"
		if(result.to_i >= 1000)
			#puts "the sum is too big(>=1000) for the next api, so we are decreasing it"
			last_result = rand(100..200)
		elsif(result.to_i >= 500 and result.to_i < 1000)
			#puts "the sum is too big(>=500 and <1000) for the next api, so we are decreasing it"
			last_result = rand(0..99)
		else
			last_result = result
		end
		Log.print_singleton(obj)
		return last_result.to_s
	end

	def fallback
		puts "This means the server goofed up and can't successfully respond to your request. (A pre-defined number is generating for you!)"
		return {"result" => "1"}
	end
end