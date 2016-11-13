class Partner::TreatmentsController < Partner::PartnerController
  def index
    @categories = Category.all
  end
end
