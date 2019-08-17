class Api::PlayersController < ApplicationController
  protect_from_forgery except: :index

  def strangers
    player_id = params[:player_id]
    player_data = Datum.find_by(player_id: player_id)
    stranger_data = Datum.where.not(player_id: player_id)
    distances = [1000]*5
    closet_player_ids = [1] * 5

    stranger_data.each do |stranger|
      distance = Math.sqrt(
        (stranger.latitude - player_data.latitude)**2 +
        (stranger.longitude - player_data.longitude)**2
      )
      distances_max = distances.max
      if distance < distances_max
        distance_idx = distances.index(distances_max)
        distances[distance_idx] = distance
        closet_player_ids[distance_idx] = stranger.id
      end
    end

    closet_stranger_data = Datum.includes(player: [:pets, :match_values]).where(player_id: closet_player_ids)
    @response['data'] = []
    closet_stranger_data.each do |closet_stranger|
      data = {}
      data['player_data'] = closet_stranger
      data['player'] = closet_stranger.player
      data['player_pet'] = closet_stranger.player.pets
      data['match_value'] = closet_stranger.player.match_values.find_by(friend_id: player_id).try(:grade)
      @response['data'].append(data)
    end

    render json: @response
  end
end
