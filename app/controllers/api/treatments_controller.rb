class API::TreatmentsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_item, only: [:index]

  def index
    @treatments = @item.treatments.order(name: :asc)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
