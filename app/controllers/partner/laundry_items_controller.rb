class Partner::LaundryItemsController < Partner::PartnerController
  before_action :set_item, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_laundry_item, only: [:edit, :update, :destroy]

  def new
    @laundry_item = @item.laundry_items.build
  end

  def create
    @laundry_item = @item.laundry_items.build(laundry_item_params)

    if @laundry_item.save
      redirect_to partner_category_treatments_path(@laundry_item.item.category),
                  notice: 'Вещь успешно добавлена'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @laundry_item.update(laundry_item_params)
      redirect_to partner_category_treatments_path(@laundry_item.item.category),
                  notice: 'Вещь успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @laundry_item.destroy
    redirect_to partner_category_treatments_path(@laundry_item.item.category),
                notice: 'Вещь успешно удалена'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_laundry_item
    @laundry_item = current_laundry.laundry_items.find_by!(item: @item)
  end

  def laundry_item_params
    params
      .require(:laundry_item)
      .permit(:decoration_multiplier)
      .merge(laundry: current_laundry)
  end
end
