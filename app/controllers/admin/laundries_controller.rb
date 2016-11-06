class Admin::LaundriesController < Admin::AdminController
  before_action :set_laundry, only: [:show, :edit, :update, :destroy]

  def index
    @laundries = Laundry.all
  end

  def show
  end

  def new
    @laundry = Laundry.new
  end

  def create
    @laundry = Laundry.new(laundry_params)

    if @laundry.save
      redirect_to admin_laundries_url, notice: 'Химчистка была успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @laundry.update(laundry_params)
      redirect_to admin_laundries_url, notice: 'Химчистка успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @laundry.destroy
    redirect_to admin_laundries_url, notice: 'Химчистка была успешно удалена.'
  end

  private

  def set_laundry
    @laundry = Laundry.find(params[:id])
  end

  def laundry_params
    params
      .require(:laundry)
      .permit(:name, :description, :category, :city_id, :logo, :background_image, :email, :password)
  end
end
