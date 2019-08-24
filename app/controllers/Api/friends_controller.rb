class Api::FriendsController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth, except: :auth
  def create
    player_id = params[:player_id]
    friend_id = params[:friend_id]
    if Friend.create(player_id: player_id, friend_id: friend_id)
      render json: true
    else
      render json: false
    end
  end
end
