require 'net/http'
require 'json'
require 'ostruct'

class MapController < ApplicationController
  def index
    @maptiler_key = ENV['MAPTILER_API_KEY']
    @user = current_user
  end

  def nearby_gyms
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = 3000

    query = <<~OVERPASS
      [out:json];
      node["leisure"="fitness_centre"](around:#{radius},#{lat},#{lng});
      out;
    OVERPASS

    uri = URI("https://overpass-api.de/api/interpreter")
    response = Net::HTTP.post_form(uri, data: query)
    data = JSON.parse(response.body)

    gyms = data["elements"].map do |gym|
      avatar_url = gym.dig("tags", "image") ||
                   gym.dig("tags", "logo") ||
                   gym.dig("tags", "photo") ||
                   nil

      # Get timezone offset in seconds
      gmt_offset = fetch_timezone_offset(gym["lat"], gym["lon"])

      OpenStruct.new(
        name: gym.dig("tags", "name") || "Unnamed Gym",
        latitude: gym["lat"],
        longitude: gym["lon"],
        avatar_url: avatar_url,
        opening_hours: gym.dig("tags", "opening_hours") || nil,
        gmt_offset: gmt_offset
      ).to_h
    end

    render json: gyms
  rescue StandardError => e
    Rails.logger.error("Error fetching gyms: #{e.message}")
    render json: [], status: 500
  end

  private

  def fetch_timezone_offset(lat, lon)
    api_key = ENV['TIMEZONEDB_KEY']
    uri = URI("http://api.timezonedb.com/v2.1/get-time-zone?key=#{api_key}&format=json&by=position&lat=#{lat}&lng=#{lon}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data["gmtOffset"] || 0
  rescue
    0
  end
end
