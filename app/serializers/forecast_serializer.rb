class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :current_time,
              :current_summary,
              :current_icon,
              :current_temperature,
              :current_humidity,
              :current_visibility,
              :current_uv_index,
              :current_apparant_temperature,
              :hourly_summary,
              :hourly_weather,
              :daily_summary,
              :daily_weather
end
