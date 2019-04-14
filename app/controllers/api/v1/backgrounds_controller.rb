class Api::V1::BackgroundsController < ApplicationController
  def show
    background_data = BackgroundService.new(look_up_params).images
    render json: BackgroundSerializer.new(Background.new(background_data))
  end

  private
  def look_up_params
    params['location']
  end
end
