class Admin::ItemsController < Admin::AdminController
  before_action :set_category, only: [:index, :new, :create]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = @category.items.build
  end

  def create
    @item = @category.items.build(item_params)

    if @item.save
      redirect_to admin_category_items_path(@item.category), notice: 'Категория успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admin_category_items_path(@item.category), notice: 'Категория успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_category_items_path(@item.category), notice: 'Категория успешно удалена'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :icon)
  end
end
