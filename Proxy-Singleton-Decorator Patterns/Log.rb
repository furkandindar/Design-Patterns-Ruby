require 'json'
class Log
	def Log.print_singleton(object)
		File.open("log.txt","a") do |f|
			
			object.each() do |data|
				f << "\n"
				f << data.to_json
			end
			f << "\n"
			f << "\n-------------\n"
		end
	end

	File.open("log.txt","a") do |e|
			e << "#####################\n"
			e << "Last Modified: " + File::mtime( "log.txt" ).to_s
			e << "\n"
	end
end