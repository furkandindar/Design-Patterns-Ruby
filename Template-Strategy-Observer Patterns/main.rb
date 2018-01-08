require_relative 'Arena'
def main()
	gladiator = Gladiator.new
	for i in  1..10
		audience= Audience.new
		gladiator.register(audience)
		puts "audience#{i} is having a seat"
	end
	puts 'which arena you want to enter? 1. Roman 2. Superhero'
	choose_arena = gets.chomp.to_i
	case choose_arena
	when 1
		arena1 = RomanArena.new(gladiator)
		arena1.tests
	when 2
		arena2 = SuperheroArena.new(gladiator)
		arena2.tests
	end
	for j in 1..10
		gladiator.deregister(audience)
		puts "audience#{j} is leaving"
	end
	puts 'No one left'
	puts '##################################'
	puts '##################################'
	puts '-+-+-+-+-+-+-+THE+-+-+-+-+-+-+-+-+'
	puts '+-+-+-+-+-+-+-END-+-+-+-+-+-+-+-+-'
	puts '##################################'
	puts '##################################'
end

main()