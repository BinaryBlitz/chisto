class Partner::LaundriesController < Partner::PartnerController
  before_action :set_laundry
  before_action :build_schedules, only: [:edit]

  def edit
  end

  def update
    if @laundry.update(laundry_params)
      redirect_to edit_laundry_profile_path, notice: 'Профиль успешно обновлен'
    else
      render :edit
    end
  end

  private

  def set_laundry
    @laundry = current_laundry
  end

  def build_schedules
    Schedule::DAYS_OF_THE_WEEK.map do |day_of_the_week|
      @laundry.schedules.find_or_initialize_by(day_of_the_week: day_of_the_week)
    end
  end

  def laundry_params
    params
      .require(:laundry)
      .permit(
        :name, :description, :city_id, :logo, :background_image, :email, :password, :phone_number,
        :delivery_fee, :free_delivery_from, :minimum_order_price, :minimum_collection_time,
        :order_processing_time, :long_order_processing_time,
        schedules_attributes: [:id, :day_of_the_week, :opens_at, :closes_at, :_destroy]
      )
  end
end
