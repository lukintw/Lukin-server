class Api::HomeController < ApplicationController
  before_action :check_auth, except: :auth
  protect_from_forgery except: :auth

  def index
    render json: @response
  end

  def auth
    fb_id = params[:fb_id]
    decode_id = Base64.decode64(fb_id)
    player = Player.find_by(id: decode_id)

    (player.blank?) ? player = Player.create(id: decode_id) : nil
    player.update(log_in_at: DateTime.now())

    @response['fb_id']= fb_id
    @response['timestamp']= player.log_in_at.strftime('%s%3N')

    render json: @response
  end
end
