class Api::PlayersController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth
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

  def filter_friends
    player_id = params[:player_id]
    stranger_data = Player.includes(:datum).where.not(id: player_id)
    if params[:gender]
      stranger_data = stranger_data.where(gender: params[:gender])
    elsif params[:age]
      start_age = params[:age].split(',')[0].to_i
      end_age = params[:age].split(',')[1].to_i
      stranger_data = stranger_data.where(birth: end_age.years.ago..start_age.years.ago)
    elsif params[:height]
      min_height = params[:height].split(',')[0].to_i
      max_height = params[:height].split(',')[1].to_i
      stranger_data = stranger_data.where(height: max_height..min_height)
    elsif params[:education]
      stranger_data = stranger_data.where(education: params[:education])
    elsif params[:personality]
      stranger_data = stranger_data.where(personality: params[:personality])
    end

    @response['data'] = stranger_data.as_json(include: { datum: { only: [:latitude, :longitude]}})
    render json: @response
  end

end
