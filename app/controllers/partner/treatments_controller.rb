class Partner::TreatmentsController < Partner::PartnerController
  def index
    @categories = Category.all.includes(items: [:treatments])
  end
end
