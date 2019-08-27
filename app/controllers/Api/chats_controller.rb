class Api::ChatsController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth, except: :auth
  def say_hello
    player_id = params[:player_id]
    friend_id = params[:friend_id]
    if PlayerChat.where(player_id: player_id, friend_id: friend_id).exists?
      @response['msg'] = 'Hello has existed'
      render json: @response
    else
      ActiveRecord::Base.transaction do
        chat_box = ChatBox.create
        PlayerChat.create(player_id: player_id, friend_id: friend_id, chat_box_id: chat_box.id)
        chat_log = chat_box.chat_logs.build
        chat_log.content = 'Hello~'
        chat_log.speaker_id = player_id
        chat_log.save
      end
      render json: true
    end
  end
  def chat_info
    player_id = params[:player_id]
    friend_id = params[:friend_id]
    player_chat = PlayerChat.find_by(player_id: player_id, friend_id: friend_id)

    @response['data'] = player_chat
    render json: @response
  end

  def update_match_value
    player_id = params[:player_id]
    friend_id = params[:friend_id]
    player_chat = PlayerChat.find_by(player_id: player_id, friend_id: friend_id)

    if player_chat
      player_chat.update(match_value: params[:match_value])
      render json: true
    else
      @response['msg'] = 'Player Chat does\'nt existed'
      render json: @response
    end
  end
end
