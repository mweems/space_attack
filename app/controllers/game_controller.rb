class GameController < ApplicationController

	def new
	end
	def fight
		player_1_ships = params[:player_1_ships].split("\r\n")
		player_2_ships = params[:player_2_ships].split("\r\n")
		player_1_fleet = FleetBuilder.build(player_1_ships)
		player_2_fleet = FleetBuilder.build(player_2_ships)
		Rails.logger.info("player 1 fleet: #{player_1_fleet.inspect}")

		@result = GameEngine.fight(player_1_fleet, player_2_fleet)
	end
end