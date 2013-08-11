class MapsController < ApplicationController
  def map
    @peopledata = Profile.data_for_map
    
    @geodata = Listing.data_for_map
    
    respond_to do |format|
      format.html
      format.json { render json: { listings: @geodata, people: @peopledata } }
    end
  end
end