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

	def attack_ship!(defender)
		return true if defender.attack == 0
		attacker_shots = Spaceship.calculate_shots(attack, defender.defense)
		defender_shots = Spaceship.calculate_shots(defender.attack, defense)

		if (attacker_shots <= defender_shots)
			#reduce attacker's defense
			self.defense = self.defense - ((attacker_shots-1) * defender.attack)
			true
		else
			defender.defense = defender.defense - (defender_shots * attack)
			false
		end
	end

	private

	def self.calculate_shots(attack, defense)
		final_volley = if(defense % attack == 0) 
							0
			 			else 
			 				1 
			 			end

		(defense / attack) + final_volley
	end
end