class Api::DatumController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth, except: :auth
  def update_data
    player_id = params[:player_id]
    if Datum.find_by(player_id: player_id).update(data_params)
      render json: true
    else
      render json: false
    end
  end

  private

  def data_params
    params.require(:data).permit(:current_hp, :point, :current_pet, :latitude, :longitude)
  end
end
