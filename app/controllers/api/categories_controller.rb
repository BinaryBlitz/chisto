class API::CategoriesController < API::APIController
  skip_before_action :restrict_access!, only: [:index]

  def index
    @categories = Category.order(name: :asc)
  end
end
