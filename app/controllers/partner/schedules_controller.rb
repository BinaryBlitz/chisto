class Partner::SchedulesController < Partner::PartnerController
  before_action :set_laundry
  before_action :build_schedules, only: [:show]

  def show
  end

  def update
    if @laundry.update(laundry_params)
      redirect_to partner_schedule_path, notice: 'График обновлен успешно'
    else
      render :show
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
      .permit(schedules_attributes: [:id, :day_of_the_week, :opens_at, :closes_at, :_destroy])
  end
end
