class Api::V1::BackgroundsController < ApiController
  def show
    background_data = Rails.cache.fetch(look_up_params + 'background') do
      BackgroundService.new(look_up_params).images
    end
    render json: BackgroundSerializer.new(Background.new(background_data))
  end

  private
  def look_up_params
    params['location']
  end
end
