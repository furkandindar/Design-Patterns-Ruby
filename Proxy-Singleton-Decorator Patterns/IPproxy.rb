require_relative 'ApiProxy'
require_relative 'Log'
require 'open-uri'

class IPproxy < ApiProxy
	def open_connection
		@base_uri = 'https://api.ipify.org?format=json'
		begin
			@ip = open(@base_uri)
			@body = @ip.read
			return @data_hash = JSON.parse(@body)
		rescue
			return fallback
		end
	end

	def parseJson
		obj = open_connection
		changed= obj["ip"].tr('.','+')
		#puts "your ip address is : #{obj["ip"]}"
		Log.print_singleton(obj)
		return changed

	end

	def fallback
		puts "This means the server goofed up and can't successfully respond to your request. (A pre-defined ip is generating for you!)"
		return {"ip"=>"111.111.11.11"}
	end

end