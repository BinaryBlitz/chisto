class Partner::CategoriesController < Partner::PartnerController
  def index
    @categories = Category.order(featured: :desc).order(name: :asc)
  end
end
