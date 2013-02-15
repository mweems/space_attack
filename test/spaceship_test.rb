require 'test/unit'
require 'space_attack'

class SpaceshipTest < Test::Unit::TestCase
	def test_space_ship_with_defense_is_alive
		assert_equal true, Spaceship.new(0,1).alive?
	end

	def test_space_ship_without_defense_is_dead
		assert_equal false, Spaceship.new(0,0).alive?
	end

	def test_space_ship_receives_damage
		ship = Spaceship.new(0,1)
		ship.deal_damage!(1)
		assert_equal 0, ship.defense
	end

	def test_engage_enemy_does_not_deal_damage_the_first_time
		ship = Spaceship.new(1,1)
		enemy = Spaceship.new(0,1)
		
		ship.engage(enemy)
		assert_equal 1, enemy.defense
		ship.engage(enemy)
		assert_equal 0, enemy.defense
	end

	def test_engage_enemy_against_multiple_enemies
		ship = Spaceship.new(1,1)
		enemy1 = Spaceship.new(0,1)
		enemy2 = Spaceship.new(0,1)
		
		ship.engage(enemy1)
		assert_equal 1, enemy1.defense
		ship.engage(enemy1)
		assert_equal 0, enemy1.defense
		ship.engage(enemy2)
		assert_equal 1, enemy2.defense
		ship.engage(enemy2)
		assert_equal 0, enemy2.defense
	end
end