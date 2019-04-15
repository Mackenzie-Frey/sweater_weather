class Api::V1::AntipodeController < ApplicationController
  def show
    look_up_params['loc']
    binding.pry
  end

  private
  def look_up_params
    params.permit(:loc)
  end
end
