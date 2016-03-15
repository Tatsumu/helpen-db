class Api::PositionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  def create
    user = User.new(create_params)
    unless user.save
        @error_message = [position.error.full_messages].compact
    end
  end
  
  def res
  end
  
  def index
  end
  
  def map
    # unless 
    @points = User.all.limit('1').order('created_at DESC')
    @hash = Gmaps4rails.build_markers(@points) do |position, marker|
      marker.lat position.lat
      marker.lng position.long
    end
    y = User.order('created_at DESC').pluck(:lat)[0]
    x = User.order('created_at DESC').pluck(:long)[0]
    uri = URI("http://geoapi.heartrails.com/api/json")
    uri.query = URI.encode_www_form({ method: "searchByGeoLocation", x: x, y: y })
    res = Net::HTTP.get_response(uri)
    json = JSON.parse(res.body)
    # puts json
    @city = json["response"]["location"][0]["city"]
    @town = json["response"]["location"][0]["town"]
      # marker.infowindow user.description
      # marker.json({title: user.title})
    
  end

  private
  def create_params
    params.permit(:lat, :long, :name, :mail, :pin)
  end
end
