class Api::PetsController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth
  def update
    if Pet.find_by(id: params[:id]).update(pet_params)
      render json: true
    else
      render json: false
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:is_used, :lv, :equipment, :experience, :go_time, :back_time)
  end
end
