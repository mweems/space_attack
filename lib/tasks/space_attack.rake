
task :check_balance do
	attacker_wins = 0
	defender_wins = 0
	10000.times do
		new_game = play_random_game
		attacker_wins = attacker_wins + 1 if new_game.winner == :attacker
		defender_wins = defender_wins + 1 if new_game.winner == :defender
	end

	puts "Attacker wins: #{attacker_wins}"
	puts "Defender wins: #{defender_wins}"


end

task :play_single_game do
	new_game = play_random_game
	puts "Attackers score: #{new_game.attacker_score}"
	puts "Attackers ships: #{new_game.attacker_remaining_ships.inspect}"
	puts
	puts
	puts "Defenders score: #{new_game.defender_score}"
	puts "Defenders ships: #{new_game.defender_remaining_ships.inspect}"
end

def play_random_game
	attackers = FleetBuilder.build(["DeathStar"])
	defenders = FleetBuilder.build(["BorgCube"])
	attackers.each { |ship| ship.fleet = attackers}
	defenders.each { |ship| ship.fleet = defenders}

	#p death_star.fleet


	ScoreKeeper.score(attackers, defenders)
end	
