class Partner::LaundriesController < Partner::PartnerController
  before_action :set_laundry, only: [:edit, :update]

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

  def laundry_params
    params
      .require(:laundry)
      .permit(:name, :description, :city_id, :logo, :background_image, :email, :password)
  end
end
