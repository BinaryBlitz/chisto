class API::TreatmentsController < API::APIController
  before_action :set_item, only: [:index]

  def index
    @treatments = @item.treatments.all
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
