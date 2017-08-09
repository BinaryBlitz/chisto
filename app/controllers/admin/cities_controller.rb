class Admin::CitiesController < Admin::AdminController
  before_action :set_city, only: %i[edit update destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to admin_cities_path, notice: 'Город успешно создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to admin_cities_path, notice: 'Город успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to admin_cities_path, notice: 'Город успешно удален'
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :latitude, :longitude)
  end
end
