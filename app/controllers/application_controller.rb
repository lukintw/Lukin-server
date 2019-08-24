class ApplicationController < ActionController::Base
  before_action :set_response

  def set_response
    @response = {
        code: 200,
        msg: "success"
    }
  end

  def check_auth
    if request.headers['HTTP_AUTH_TOKEN']
      fb_id = request.headers['HTTP_FB_ID']
      key = Player.find_by(id: fb_id).log_in_at.strftime('%s%3N')
      data = fb_id
      token = OpenSSL::HMAC.hexdigest('SHA256', key, data)
      if token != request.headers['HTTP_AUTH_TOKEN']
        @response = {
          code: 401,
          msg: 'token invalid'
        }
        render json: @response
      end
    else
      @response = {
        code: 401,
        msg: 'unauth'
      }
      render json: @response
    end
  end
end
