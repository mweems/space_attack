$LOAD_PATH << 'lib'
require "space_attack"

task :default => :test

task :test do
	FileList["test/*_test.rb"].each do |test_file|
		sh "ruby -I lib #{test_file}"
	end
end

task :check_balance do
	attacker_wins = 0
	defender_wins = 0
	1000.times do
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
	attackers = (1..10).map do 
		Spaceship.new(rand(6) + 1,rand(6))
	end
	defenders = (1..10).map do
		Spaceship.new(rand(14),rand(13))
	end
	ScoreKeeper.score(attackers, defenders)
end	

