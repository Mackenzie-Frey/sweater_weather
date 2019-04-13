class Api::V1::BackgroundController < ApplicationController
  def show
    background_data = BackgroundService.new(look_up_params).url
    render json: BackgroundSerializer.new(Background.new(background_data))
  end

  private
  def look_up_params
    params['location']
  end
end
