require_relative 'Gladiator'
require 'timeout'
class Arena
	def initialize(gladiator)
		@gladiator = gladiator
	end

	def tests
		puts 'fight Test is about to start...'
		loadingGame
		fightTest
		puts 'fight test ended!'
		puts '##################################'
		puts 'question Test is about to start...'
		loadingGame
		questionTest
		puts 'question test ended!'
		puts '##################################'
		puts 'Speed Test is about to start...'
		loadingGame
		speedTest
		puts 'speed test ended!'
		puts '##################################'
		puts '##################################'
	end

	def fightTest
		raise NotImplementedError
	end

	def questionTest
		raise NotImplementedError
	end

	def speedTest
		raise NotImplementedError
	end

	def loadingGame
		for i in 1..2
			puts "game will start in #{3-i}"
			sleep(1)
		end
	end
end

class RomanArena < Arena
	def fightTest
		puts 'you are fighting against Spartacus'
		@str = 10
		@hp = 5
		@gladiator_hp = @gladiator.hp
		puts "your strength is: #{@gladiator.str}"
		puts "Spartacus' strength is: #{@str}"
		if @gladiator.str >= @str
			while @gladiator_hp != 0 and @hp != 0
				puts "your hp is: #{@gladiator_hp}"
				puts "Spartacus' hp is: #{@hp}"
				@x = rand(1..2)
				puts 'guess a number 1 or 2, if you guess the number right you will give a damage to Spartacus'
				@guess = gets.chomp.to_i
				if(@guess == @x)
					puts 'you harmed him'
					@hp= @hp -1
				else
					puts 'he harmed you!'
					@gladiator.notify("harmed")
					puts '---------------------------------'
					@gladiator_hp = @gladiator_hp-1
				end
			end
			if(@gladiator_hp == 0)
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			else
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			end
		else
			while @gladiator_hp != 0 and @hp != 0
				puts "your hp is: #{@gladiator_hp}"
				puts "Spartacus' hp is: #{@hp}"
				@y = rand(1..3)
				puts 'guess a number 1 or 3, if you guess the number right you will give a damage to Spartacus'
				@guess = gets.chomp.to_i
				if(@guess == @y)
					puts 'you harmed him'
					@hp= @hp -1
				else
					puts 'he harmed you!'
					@gladiator.notify("harmed")
					puts '---------------------------------'
					@gladiator_hp = @gladiator_hp-1
				end
			end
			if(@gladiator_hp == 0)
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			else
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			end
		end
	end
	def questionTest
		puts 'you need to answer correctly at least 2 out of 3 question to win'
		@true_flag=0
		@false_flag=0
		if @gladiator.int <= 5
			puts "you look a little stupid (your intelligence is: #{@gladiator.int}), let me ask you easy questions #{@gladiator.name}"
			puts '------------'
			puts 'Question 1:'
			puts '5x3+2-1x4/2 =?'
			@a1=gets.chomp.to_i
			if @a1 == 15
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 2:'
			puts 'When was Ataturk(founder of the Republic of Turkey) born ?'
			@a2=gets.chomp.to_i
			if @a2 == 1881
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 3:'
			puts 'what is sin90 ?'
			@a3=gets.chomp.to_i
			if @a3 == 1
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			if @true_flag>@false_flag
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			else
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			end
		else
			puts "you look like a wise man (your intelligence is: #{@gladiator.int}), let me ask you hard questions #{@gladiator.name}"
			puts '------------'
			puts 'Question 1:'
			puts 'An apartment has 4 bedrooms. Each bedroom has 3 bookcases. How many bookcases are there in the apartment?'
			@b1=gets.chomp.to_i
			if @b1 == 12
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 2:'
			puts 'When was the Declaration of Independence signed?(for the United States)'
			@b2=gets.chomp.to_i
			if @b2 == 1776
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 3:'
			puts "What's the sum of the hexagonal inner angles?"
			@b3=gets.chomp.to_i
			if @b3 == 720
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			if @true_flag >=2
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			else
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			end
		end
	end
	def speedTest
		puts 'you are in the speed arena'
		puts "your speed is: #{@gladiator.spd}"
		puts '-------------------------------'
		puts "write AFYONKARAHISAR in #{@gladiator.spd} seconds to win"
		t=Thread.new{
			@val=gets.chomp
			Thread.stop
		}
		sleep(@gladiator.spd)
		Thread.kill(t)
		puts
		puts 'time is up!'
		puts "lets see the result #{@gladiator.name}!"
		if @val == 'afyonkarahisar'
			puts 'YOU WIN !'
			puts '--------------------------'
			@gladiator.notify("win")
		else
			puts 'YOU LOST !'
			puts '--------------------------'
			@gladiator.notify("lost")
		end
	end
end

class SuperheroArena < Arena
	def fightTest
		puts 'you are fighting against Hulk'
		@str = 8
		@hp = 8
		@gladiator_hp = @gladiator.hp
		puts "your strength is: #{@gladiator.str}"
		puts "Hulk's strength is: #{@str}"
		if @gladiator.str >= @str
			while @gladiator_hp != 0 and @hp != 0
				puts "your hp is: #{@gladiator_hp}"
				puts "Hulk's hp is: #{@hp}"
				@x = rand(1..2)
				puts 'guess a number 1 or 2, if you guess the number right you will give a damage to Spartacus'
				@guess = gets.chomp.to_i
				if(@guess == @x)
					puts 'you harmed him'
					@hp= @hp -1
				else
					puts 'he harmed you!'
					@gladiator.notify("harmed")
					puts '---------------------------------'
					@gladiator_hp = @gladiator_hp-1
				end
			end
			if(@gladiator_hp == 0)
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			else
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			end
		else
			while @gladiator_hp != 0 and @hp != 0
				puts "your hp is: #{@gladiator_hp}"
				puts "Hulk's hp is: #{@hp}"
				@y = rand(1..3)
				puts 'guess a number 1 or 3, if you guess the number right you will give a damage to Hulk'
				@guess = gets.chomp.to_i
				if(@guess == @y)
					puts 'you harmed him'
					@hp= @hp -1
				else
					puts 'he harmed you!'
					@gladiator.notify("harmed")
					puts '---------------------------------'
					@gladiator_hp = @gladiator_hp-1
				end
			end
			if(@gladiator_hp == 0)
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			else
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			end
		end
	end
	def questionTest
		puts 'you need to answer exactly 3 out of 3 question correctly to win'
		@true_flag=0
		@false_flag=0
		if @gladiator.int <= 8
			puts "you look a little stupid (your intelligence is: #{@gladiator.int}), let me ask you easy questions #{@gladiator.name}"
			puts '------------'
			puts 'Question 1:'
			puts '11x9 =?'
			@a1=gets.chomp.to_i
			if @a1 == 99
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 2:'
			puts 'When was The Republic of Turkey founded?'
			@a2=gets.chomp.to_i
			if @a2 == 1923
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 3:'
			puts 'what is cos90 ?'
			@a3=gets.chomp.to_i
			if @a3 == 0
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			if @true_flag>@false_flag
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			else
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			end
		else
			puts "you look like a wise man (your intelligence is: #{@gladiator.int}), let me ask you hard questions #{@gladiator.name}"
			puts '------------'
			puts 'Question 1:'
			puts 'A test has 20 questions. If Steven gets 80 percent correct, how many questions did Steven missed?'
			@b1=gets.chomp.to_i
			if @b1 == 4
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 2:'
			puts 'World War I began in which year?'
			@b2=gets.chomp.to_i
			if @b2 == 1914
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			puts '------------'
			puts 'Question 3:'
			puts "What's the one angle of the hexagonal ?"
			@b3=gets.chomp.to_i
			if @b3 == 120
				puts 'you were right!'
				@true_flag = @true_flag +1
			else
				puts 'you were wrong!'
				@false_flag = @false_flag +1
			end
			if @true_flag == 3
				puts 'YOU WIN !'
				puts '--------------------------'
				@gladiator.notify("win")
			else
				puts 'YOU LOST !'
				puts '--------------------------'
				@gladiator.notify("lost")
			end
		end

	end
	def speedTest
		puts 'you are in the speed arena'
		puts "your speed is: #{@gladiator.spd}"
		puts '-------------------------------'
		puts "write BESIKTAS in #{@gladiator.spd} seconds to win"
		t=Thread.new{
			@val=gets.chomp
			Thread.stop
		}
		sleep(@gladiator.spd)
		Thread.kill(t)
		puts
		puts 'time is up!'
		puts "lets see the result #{@gladiator.name}!"
		if @val == 'besiktas'
			puts 'YOU WIN !'
			puts '--------------------------'
			@gladiator.notify("win")
		else
			puts 'YOU LOST !'
			puts '--------------------------'
			@gladiator.notify("lost")
		end
	end
end