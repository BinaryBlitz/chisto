class API::CitiesController < API::APIController
  def index
    @cities = City.all
  end
end
