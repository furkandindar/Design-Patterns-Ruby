require_relative 'ApiProxy'
require_relative 'Log'
require 'open-uri'

class FactProxy < ApiProxy
	def initialize(object)
		@number = object.parseJson
	end

	def open_connection
		@base_uri = 'http://numbersapi.com/' + @number + '?json'
		begin
			@send_number = open(@base_uri)
			@body = @send_number.read
			return @data_hash = JSON.parse(@body)
		rescue
			fallback
		end
	end

	def parseJson
		obj = open_connection
		fact = obj["text"]
		Log.print_singleton(obj)
		return fact
	end

	def fallback
		puts "This means the server goofed up and can't successfully respond to your request. (A pre-defined fact is generating for you!)"
		return {"text" => "FURKAN DINDAR is number 1 !"}
	end
end