require_relative 'Audience'

module Subject

	def initialize
		@observers = []
	end

	def register(observer)
		@observers << observer
	end

	def deregister(observer)
		@observers.delete(observer)
	end

	def notify(event_type)
		@observers.each do |o|
			o.update(event_type)
		end
	end

end

class Gladiator
	include Subject

	attr_reader :spd, :str, :int, :name
	attr_accessor :hp

	def initialize()
		super()
		puts 'Creating the Gladiator!'
		puts 'name:'
		@name = gets.chomp
		puts 'speed:'
		@spd = gets.chomp.to_i
		puts 'strength:'
		@str = gets.chomp.to_i
		puts 'intelligence:'
		@int = gets.chomp.to_i
		puts 'health:'
		@hp = gets.chomp.to_i
		if is_twenty
			createAgain
		end
		chooseWeapon
		puts "Gladiator #{@name}'s abilities:"
		puts "str: #{@str}"
		puts "int: #{@int}"
		puts "spd: #{@spd}"
		puts "hp: #{@hp}"
	end

end
	 def is_twenty
		if (spd+str+int+hp) > 20
			puts 'the total of the attributes can not be more than 20 ! you are trying to create a super human !'
			return true
		end
	end

	def createAgain
		puts 'Creating the Gladiator Again! (Please be careful distributing the attributes)'
		puts 'name:'
		@name = gets.chomp
		puts 'speed:'
		@spd = gets.chomp.to_i
		puts 'strength:'
		@str = gets.chomp.to_i
		puts 'intelligence:'
		@int = gets.chomp.to_i
		puts 'health:'
		@hp = gets.chomp.to_i
		if is_twenty
			createAgain
		end
	end

	def chooseWeapon
		puts "Which weapon do you want to choose?\n 1. Long Sword(+5 str)\n 2. Book of Science(+5 int)\n 3. Bolt Sneakers(+5 spd)"
		@decision = gets.chomp.to_i
		case @decision
		when 1
			@str = @str +5
		when 2
			@int = @int +5
		when 3
			@spd = @spd +5
		end
	end