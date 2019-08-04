class Api::HomeController < ApplicationController
    def index
        player_id = params['id']
        player = Player.find_by(id: player_id)

        @response['data']= player
        @response['player_data']= player.try(:datum)
        @response['player_pets']= player.try(:pets)
    
        render json: @response
    end
end
