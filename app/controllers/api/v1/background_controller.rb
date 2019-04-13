class Api::V1::BackgroundController < ApplicationController
  def show
    background_data = BackgroundService.new(look_up_params)
    render json: BackgroundSerializer.new(background_data)
  end

  private
  def look_up_params
    binding.pry
    params['']
  end
end
