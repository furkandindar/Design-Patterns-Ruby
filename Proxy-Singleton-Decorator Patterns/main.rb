require_relative 'DecoratorPattern'
require_relative 'Log'

def main()
	dp = DecoratorPattern.new()
	dp.print_data_to_screen
end

main()