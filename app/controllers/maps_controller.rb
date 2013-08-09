class MapsController < ApplicationController
  def map
    @peopledata = Profile.count(group: 'nationality')
    @peopledata = @peopledata.collect { |nationality, num| [nationality, num] }
    @peopledata = @peopledata.insert(0, ['Nationality', 'Users'])

    @geodata = Listing.where.not(state: 'inactive').count(group: 'country')
    @geodata = @geodata.collect { |country, num| [country, num] }
    @geodata = @geodata.insert(0, ['Country', 'Listings'])
    respond_to do |format|
      format.html
      format.json { render json: { list: @geodata, people: @peopledata } }
    end
  end
end