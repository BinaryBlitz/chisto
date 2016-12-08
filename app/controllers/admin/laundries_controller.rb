class Admin::LaundriesController < Admin::AdminController
  before_action :set_city, only: [:index, :new, :create]
  before_action :set_laundry, only: [:show, :edit, :update, :destroy]

  def index
    @laundries = @city.laundries
  end

  def show
  end

  def new
    @laundry = @city.laundries.build
  end

  def create
    @laundry = @city.laundries.build(laundry_params)

    if @laundry.save
      redirect_to admin_city_laundries_url(@laundry.city), notice: 'Химчистка была успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @laundry.update(laundry_params)
      redirect_to admin_city_laundries_url(@laundry.city), notice: 'Химчистка успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @laundry.destroy
    redirect_to admin_city_laundries_url(@laundry.city), notice: 'Химчистка была успешно удалена.'
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def set_laundry
    @laundry = Laundry.find(params[:id])
  end

  def laundry_params
    params
      .require(:laundry)
      .permit(
        :name, :description, :city_id,
        :logo, :logo_cache, :background_image, :background_image_cache,
        :email, :password
      )
  end
end
