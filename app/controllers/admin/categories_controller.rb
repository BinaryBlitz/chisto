class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Категория успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Категория успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Категория успешно удалена'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params
      .require(:category)
      .permit(:name, :description, :icon, :icon_cache, :color, :featured)
  end
end
