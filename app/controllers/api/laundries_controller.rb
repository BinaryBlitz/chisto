class API::LaundriesController < API::APIController
  skip_before_action :restrict_access!, only: [:index, :show]
  before_action :set_city, only: [:index]

  def index
    @laundries = Laundry
      .joins(:schedules)
      .includes(:schedules, laundry_treatments: :treatment)
      .order(rating: :desc)
      .enabled
      .valid
  end

  def show
    @laundry = Laundry.find(params[:id])
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end
end
