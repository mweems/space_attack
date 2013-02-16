require 'test/unit'
require 'space_attack'

class SuperShotTest < Test::Unit::TestCase
	def test_supershot_immediately_kills_enemy
		100.times do 
			ship = Spaceship.new(1,2)
			enemy = Spaceship.new(1,500)
			ship.extend(Attributes::SuperShot)
			ship.engage(enemy)
			ship.engage(enemy)
			return if !enemy.alive?
		end
		fail "SuperShot never shot"
	end

	def test_supershot_never_shoots_without_being_locked_on
		100.times do 
			ship = Spaceship.new(1,2)
			enemy = Spaceship.new(1,500)
			ship.extend(Attributes::SuperShot)
			ship.engage(enemy)
			fail "Supershot fired" if !enemy.alive?
		end
	end

	def test_supershot_only_shoots_sometimes
		100.times do 
			ship = Spaceship.new(1,1)
			enemy = Spaceship.new(1,500)
			ship.extend(Attributes::SuperShot)
			ship.engage(enemy)
			ship.engage(enemy)
			return if enemy.alive?
		end
		fail "Supershot always fires" 
	end
end