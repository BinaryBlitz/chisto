class API::ItemsController < API::APIController
  before_action :set_category, only: [:index]

  def index
    @items = @category.items
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
