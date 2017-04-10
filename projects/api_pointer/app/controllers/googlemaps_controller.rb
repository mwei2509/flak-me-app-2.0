class GooglemapsController < ApplicationController

  require 'rest_client'

  def index
    render json: RestClient.get("https://maps.googleapis.com/maps/api/directions/json?key=#{ENV["google_map_key"]}&origin=#{params[:origin]}&destination=#{params[:destination]}&waypoints=optimize:true|#{params[:waypoints]}&mode=#{params[:mode]}")
    # render json: RestClient.get("https://maps.googleapis.com/maps/api/directions/json?key=#{ENV["google_map_key"]}&origin=")
  end

  def api
    render plain: ENV["google_map_key"]
  end
end
