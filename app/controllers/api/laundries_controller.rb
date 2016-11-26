class API::LaundriesController < API::APIController
  before_action :set_city, only: [:index]

  def index
    @laundries = Laundry.joins(:schedules).includes(:schedules, laundry_treatments: :treatment)
  end

  def show
    @laundry = Laundry.find(params[:id])
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end
end
