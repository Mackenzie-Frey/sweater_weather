class Api::V1::AntipodeController < ApplicationController
  def show
    antipode = AntipodeFacade.new(look_up_params['loc']).antipode

    render json: AntipodeSerializer.new(antipode)
  end

  private
  def look_up_params
    params.permit(:loc)
  end
end
