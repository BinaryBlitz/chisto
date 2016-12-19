class Partner::TreatmentsController < Partner::PartnerController
  before_action :set_category, only: [:index]

  def index
    @items = @category.items.includes(:treatments).order(name: :asc)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
