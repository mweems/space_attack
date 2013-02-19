require 'test_helper'

class ChargeTest < Test::Unit::TestCase
	def test_charge_increases_defense_sometimes
		1000.times do |variable|
			@ship1 = Spaceship.new(1,1)
			@ship1.extend(Attributes::Charge)
			ship2 = Spaceship.new(2,2)
			ship2.engage(@ship1)
			ship2.engage(@ship1)
			return if @ship1.defense == 1
		end
		fail "Ships defense never increased"
	end

	def test_charge_doesnt_always_increase_defense
		100.times do |variable|
			ship1 = Spaceship.new(1,1)
			ship1.extend(Attributes::Charge)
			ship2 = Spaceship.new(1,2)
			ship2.engage(ship1)
			ship2.engage(ship1)
			return if !ship1.alive?
		end
		fail "ship with charge never died"
	end

	def test_charge_doesnt_charge_more_than_start_defense
		1000.times do |variable|
			@ship1 = Spaceship.new(1,1)
			@ship1.extend(Attributes::Charge)
			ship2 = Spaceship.new(2,2)
			ship2.engage(@ship1)
			ship2.engage(@ship1)
			return if @ship1.defense == 1
		end
		fail "ship overcharged"
	end
	
end