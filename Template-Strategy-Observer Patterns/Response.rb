class Response
	attr_reader :win, :lost, :harmed
	def respond
		raise NotImplementedError
	end
end

class Supporter < Response
	def respond
		@win = 'Yess, we won ! -supporter'
		@lost = 'Noo, we lost ! -supporter'
		@harmed = 'OMG ! Hope he is good -supporter'
	end
end

class Neutral < Response
	def respond
		@win = 'Good game, well played ! -neutral'
		@lost = 'Poor game, time wasting ! -neutral'
		@harmed = 'oh, the game is warming up ! -neutral'
	end
end

class Against < Response
	def respond
		@win = 'Noo, he did not deserve to win at all ! -against'
		@lost = 'HAHAHAHA, GAME OVER little guy -against'
		@harmed = 'Yess, that was a good attack !! -against'
	end
end