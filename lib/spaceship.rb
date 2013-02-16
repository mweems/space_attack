class Spaceship

	attr_reader :attack
	attr_accessor :defense

	def initialize(attack, defense)
		@attack = attack
		@defense = defense
	end

	def to_s
		"(attack:#{@attack} defense: #{@defense})\n"
	end

	def alive?
		@defense > 0
	end

	def dead!
		@defense = 0
	end

	def deal_damage!(damage, enemy)
		@defense = @defense - damage
	end

	def engage(enemy)
		if @current_enemy != enemy
			@current_enemy = enemy
		else
			enemy.deal_damage!(@attack, self)
		end
	end
end