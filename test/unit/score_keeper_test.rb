require 'test_helper'


class InvincibleShip < Spaceship
	def deal_damage!(damage, enemy)
	end
end

class ScoreKeeperTest < Test::Unit::TestCase
	def test_attacker_has_one_ship_defender_has_none
		ship = Spaceship.new(1,0)
		result = ScoreKeeper.score([ship], [])
		assert_equal [ship], result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_attacker_kills_defender
		attacker = Spaceship.new(1,1)
		defender = Spaceship.new(0,1)
		result = ScoreKeeper.score([attacker], [defender])
		assert_equal [attacker], result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_defender_kills_attacker
		attacker = Spaceship.new(1,1)
		defender = Spaceship.new(1,2)	
		result = ScoreKeeper.score([attacker], [defender])
		assert_empty result.attacker_remaining_ships 
		assert_equal [defender], result.defender_remaining_ships
	end

	def test_attacker_kills_defender_after_multiple_shots
		attacker = Spaceship.new(2,5)
		defender = Spaceship.new(1,5)	
		result = ScoreKeeper.score([attacker], [defender])
		assert_equal [attacker], result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_defender_kills_attacker_after_multiple_shots
		attacker = Spaceship.new(2,6)
		defender = Spaceship.new(2,7)	
		result = ScoreKeeper.score([attacker], [defender])
		assert_empty result.attacker_remaining_ships 
		assert_equal [defender], result.defender_remaining_ships
	end

	def test_multiple_attackers_kill_single_defender
		attacker1 = Spaceship.new(2,2)
		attacker2 = Spaceship.new(1,2)
		defender = Spaceship.new(1,5)
		result = ScoreKeeper.score([attacker1, attacker2], [defender])
		assert_equal [attacker2], result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_all_attackers_and_defenders_die
		attacker = Spaceship.new(1,1)
		defender = Spaceship.new(1,1)
		result = ScoreKeeper.score([attacker], [defender])
		assert_empty result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_damages_ships_using_deal_damage
		attacker = InvincibleShip.new(1,1)
		defender = Spaceship.new(200,200)
		result = ScoreKeeper.score([attacker], [defender])
		assert_equal [attacker], result.attacker_remaining_ships 
		assert_empty result.defender_remaining_ships
	end

	def test_ships_fleets_match_the_resulting_fleet
		attacker = Spaceship.new(1,1)
		defender = Spaceship.new(1,1)
		attackers = [attacker]
		defenders = [defender]
		attacker.fleet = attackers
		defender.fleet = defenders
		result = ScoreKeeper.score(attackers, defenders)
		assert_equal true, attacker.fleet == result.attacker_remaining_ships 
		assert_equal true, defender.fleet == result.defender_remaining_ships
	end
end