class Partner::TreatmentsController < Partner::PartnerController
  def index
    @categories = Category.includes(items: [:treatments]).order(name: :asc)
  end
end
