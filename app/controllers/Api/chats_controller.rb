class Api::ChatsController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth, except: :auth
  def say_hello
    player_id = params[:player_id]
    friend_id = params[:friend_id]
    if PlayerChat.where(player_id: player_id, friend_id: friend_id ).exists?
      @response['msg'] = 'Hello has existed'
      render json: @response
    else
      ActiveRecord::Base.transaction do
        player_chat = PlayerChat.create(player_id: player_id, friend_id: friend_id)
        chat_box = player_chat.create_chat_box
        chat_log = chat_box.chat_logs.build
        chat_log.content = 'Hello~'
        chat_log.speaker_id = player_id
        chat_log.save
      end
      render json: true
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:is_used, :lv, :equipment, :experience, :go_time, :back_time)
  end
end
