class API::ItemsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_category, only: [:index]
  before_action :set_items, only: [:index]

  def index
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def set_items
    @items = if @category.present?
               @category.items.order(name: :asc)
             else
               Item.all.order(name: :asc)
             end
  end
end
