class API::LaundriesController < API::APIController
  skip_before_action :restrict_access!, only: %i[index show]
  before_action :set_city, only: [:index]
  before_action :set_long_treatment, only: [:index]

  def index
    @laundries = @city.laundries
      .joins(:schedules)
      .order(rating: :desc)
      .enabled.valid
      .distinct
  end

  def show
    @laundry = Laundry.find(params[:id])
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def set_long_treatment
    @long_treatment = (ActiveRecord::Type::Boolean.new.deserialize(params[:long_treatment]) == true)
  end
end
