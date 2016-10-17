class API::CitiesController < API::APIController
  skip_before_action :restrict_access!, only: [:index]

  def index
    @cities = City.all
  end
end
