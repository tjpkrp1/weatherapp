class WelcomeController < ApplicationController

  def index
  end

  def test
    response = HTTParty.get("http://api.wunderground.com/api/
    #{ENV['wunderground_api_key']}/geolookup/conditions/q/LA/New_Orleans.json")

    @results = {}
    @results[:location] = response['location']['city']
    @results[:temp_f] = response['current_observation']['temp_f']
    @results[:temp_c] = response['current_observation']['temp_c']
    @results[:weather_icon] = response['current_observation']['icon_url']
    @results[:weather_words] = response['current_observation']['weather']
    @results[:forecast_link] = response['current_observation']['forecast_url']
    @results[:real_feel] = response['current_observation']['feelslike_f']
  end
end

