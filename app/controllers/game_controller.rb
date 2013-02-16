class GameController < ApplicationController
	def fight
		player_1_ships = params[:player_1_ships].split("\r\n")
		player_2_ships = params[:player_2_ships].split("\r\n")
		player_1_fleet = FleetBuilder.build(player_1_ships)
		player_2_fleet = FleetBuilder.build(player_2_ships)

		@result = ScoreKeeper.score(player_1_fleet, player_2_fleet)
	end
end