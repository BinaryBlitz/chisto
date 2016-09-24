class API::LaundriesController < API::APIController
  def index
    @laundries = Laundry.all
  end

  def show
    @laundry = Laundry.find(params[:id])
  end
end
